"""Logging service with file rotation and streaming support"""
import logging
import logging.handlers
from pathlib import Path
from datetime import datetime, timedelta, timezone
from typing import Optional, List
import threading
import sys
import asyncio
import queue
from dataclasses import dataclass
import sidecar_api_pb2 as pb2
import domain_models_pb2 as domain_pb2

# UTC+8 timezone
UTC_PLUS_8 = timezone(timedelta(hours=8))


@dataclass
class LogEntry:
    """Internal log entry representation"""
    timestamp: int  # milliseconds since epoch
    level: int
    logger_name: str
    message: str
    exception: Optional[str] = None


class LogStreamHandler(logging.Handler):
    """Custom handler that streams logs to subscribers via asyncio.Queue"""
    
    def __init__(self):
        super().__init__()
        self._subscribers: List[asyncio.Queue] = []
        self._lock = threading.Lock()
        self._loop: Optional[asyncio.AbstractEventLoop] = None
    
    def set_loop(self, loop: asyncio.AbstractEventLoop):
        """Set the event loop to use for thread-safe queue operations"""
        with self._lock:
            self._loop = loop

    def subscribe(self, min_level: int = logging.DEBUG) -> asyncio.Queue:
        """Subscribe to log stream (returns an asyncio.Queue)"""
        log_queue = asyncio.Queue(maxsize=1000)
        with self._lock:
            self._subscribers.append(log_queue)
            # Try to auto-capture loop if not set
            if not self._loop:
                try:
                    self._loop = asyncio.get_event_loop()
                except RuntimeError:
                    pass
        return log_queue
    
    def unsubscribe(self, log_queue: asyncio.Queue):
        """Unsubscribe from log stream"""
        with self._lock:
            if log_queue in self._subscribers:
                self._subscribers.remove(log_queue)
    
    def emit(self, record: logging.LogRecord):
        """Emit log record to all subscribers thread-safely"""
        try:
            entry = LogEntry(
                timestamp=int(record.created * 1000),
                level=record.levelno,
                logger_name=record.name,
                message=self.format(record),
                exception=record.exc_text if record.exc_info else None
            )
            
            with self._lock:
                loop = self._loop
                subscribers = self._subscribers[:]
            
            if loop and subscribers:
                for subscriber_queue in subscribers:
                    loop.call_soon_threadsafe(self._safe_put, subscriber_queue, entry)
        except Exception:
            self.handleError(record)

    def _safe_put(self, q: asyncio.Queue, entry: LogEntry):
        """Put entry in asyncio.Queue, dropping old messages if full"""
        try:
            q.put_nowait(entry)
        except asyncio.QueueFull:
            try:
                q.get_nowait()
                q.put_nowait(entry)
            except:
                pass


class ReopeningFileHandler(logging.Handler):
    """File handler with daily rotation (UTC+8) and auto-reopening on deletion"""

    def __init__(self, log_dir: Path, retention_days: int = 7):
        super().__init__()
        self.log_dir = log_dir
        self.retention_days = retention_days
        self.current_file = None
        self.stream = None
        self._lock = threading.Lock()

    def _get_log_file_path(self) -> Path:
        """Get the current log file path based on date (UTC+8)"""
        now_utc8 = datetime.now(UTC_PLUS_8)
        return self.log_dir / f"sidecar_{now_utc8.strftime('%Y%m%d')}.log"

    def _open_file(self):
        """Open or reopen the log file"""
        log_file = self._get_log_file_path()

        # Close existing stream if file path changed (daily rotation) or file was deleted
        if self.stream:
            if self.current_file != log_file or not self.current_file.exists():
                self.stream.close()
                self.stream = None

        # Open new stream if needed
        if not self.stream:
            self.current_file = log_file
            self.stream = open(log_file, 'a', encoding='utf-8')

    def emit(self, record: logging.LogRecord):
        """Emit a log record, reopening file if necessary"""
        try:
            with self._lock:
                self._open_file()
                msg = self.format(record)
                self.stream.write(msg + '\n')
                self.stream.flush()
        except Exception:
            self.handleError(record)

    def close(self):
        """Close the handler"""
        with self._lock:
            if self.stream:
                self.stream.close()
                self.stream = None
        super().close()


class LoggingService:
    """Centralized logging service"""
    
    def __init__(self, log_dir: Path, retention_days: int = 7):
        self.log_dir = log_dir
        self.retention_days = retention_days
        self.stream_handler = LogStreamHandler()
        self._current_level = logging.INFO
        self.file_handler = None
        
        # Try to create log directory, but don't crash if it fails
        try:
            self.log_dir.mkdir(parents=True, exist_ok=True)
            self.file_logging_available = True
        except Exception as e:
            print(f"Warning: Could not create log directory {log_dir}: {e}")
            self.file_logging_available = False
            
        self._setup_logging()
    
    def _setup_logging(self):
        """Setup logging configuration"""
        root_logger = logging.getLogger()
        
        # Create formatter
        formatter = logging.Formatter(
            '[%(asctime)s] %(levelname)s in %(name)s: %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S'
        )
        
        # Console handler (standard output for Flutter capture)
        console_handler = logging.StreamHandler(sys.stdout)
        console_handler.setLevel(logging.DEBUG)
        console_handler.setFormatter(formatter)
        root_logger.addHandler(console_handler)
        
        # Set root logger level to DEBUG
        root_logger.setLevel(logging.DEBUG)
        
        # File handler with auto-reopening on deletion
        if self.file_logging_available:
            try:
                self.file_handler = ReopeningFileHandler(self.log_dir, self.retention_days)
                self.file_handler.setLevel(logging.DEBUG)
                self.file_handler.setFormatter(formatter)
                root_logger.addHandler(self.file_handler)
            except Exception as e:
                print(f"Warning: Could not setup file logging: {e}")
                self.file_logging_available = False
        
        # Stream handler for gRPC streaming
        self.stream_handler.setLevel(logging.DEBUG)
        self.stream_handler.setFormatter(formatter)
        root_logger.addHandler(self.stream_handler)
        
        logging.info("Logging service initialized")
    
    def set_level(self, level: int):
        """Set global log level"""
        self._current_level = level
        logging.getLogger().setLevel(level)
        logging.info(f"Log level set to {logging.getLevelName(level)}")
    
    def get_level(self) -> int:
        """Get current log level"""
        return self._current_level
    
    def subscribe_stream(self, min_level: int = logging.DEBUG) -> asyncio.Queue:
        """Subscribe to log stream"""
        return self.stream_handler.subscribe(min_level)
    
    def unsubscribe_stream(self, log_queue: asyncio.Queue):
        """Unsubscribe from log stream"""
        self.stream_handler.unsubscribe(log_queue)
    
    def get_logs(
        self,
        start_time: int,
        end_time: int,
        min_level: int = logging.DEBUG,
        limit: Optional[int] = None
    ) -> List[LogEntry]:
        """Get historical logs from files"""
        entries = []

        # Determine which log files to read (using UTC+8)
        start_dt = datetime.fromtimestamp(start_time / 1000, tz=UTC_PLUS_8)
        end_dt = datetime.fromtimestamp(end_time / 1000, tz=UTC_PLUS_8)

        current_dt = start_dt
        while current_dt <= end_dt:
            log_file = self.log_dir / f"sidecar_{current_dt.strftime('%Y%m%d')}.log"
            if log_file.exists():
                entries.extend(self._parse_log_file(log_file, start_time, end_time, min_level))
            current_dt += timedelta(days=1)

        # Sort by timestamp
        entries.sort(key=lambda x: x.timestamp)

        # Apply limit
        if limit and len(entries) > limit:
            entries = entries[-limit:]

        return entries
    
    def _parse_log_file(
        self,
        log_file: Path,
        start_time: int,
        end_time: int,
        min_level: int
    ) -> List[LogEntry]:
        """Parse log file and extract entries"""
        entries = []
        
        try:
            with open(log_file, 'r', encoding='utf-8') as f:
                for line in f:
                    entry = self._parse_log_line(line)
                    if entry and entry.timestamp >= start_time and entry.timestamp <= end_time:
                        if entry.level >= min_level:
                            entries.append(entry)
        except Exception as e:
            logging.error(f"Error parsing log file {log_file}: {e}")
        
        return entries
    
    def _parse_log_line(self, line: str) -> Optional[LogEntry]:
        """Parse a single log line"""
        try:
            # Format: [2026-01-03 14:00:00] INFO in module: message
            if not line.startswith('['):
                return None
            
            parts = line.split('] ', 2)
            if len(parts) < 3:
                return None
            
            # Parse timestamp
            timestamp_str = parts[0][1:]  # Remove leading '['
            dt = datetime.strptime(timestamp_str, '%Y-%m-%d %H:%M:%S')
            timestamp = int(dt.timestamp() * 1000)
            
            # Parse level
            level_and_logger = parts[1].split(' in ', 1)
            level_str = level_and_logger[0]
            level = getattr(logging, level_str, logging.INFO)
            
            logger_name = level_and_logger[1] if len(level_and_logger) > 1 else 'unknown'
            
            # Message
            message = parts[2].strip()
            
            return LogEntry(
                timestamp=timestamp,
                level=level,
                logger_name=logger_name,
                message=message
            )
        except Exception:
            return None
    
    def cleanup_old_logs(self):
        """Clean up logs older than retention period (UTC+8)"""
        if self.retention_days <= 0:
            return  # Never delete if retention is 0

        now_utc8 = datetime.now(UTC_PLUS_8)
        cutoff_date = now_utc8 - timedelta(days=self.retention_days)

        for log_file in self.log_dir.glob("sidecar_*.log"):
            try:
                # Extract date from filename
                date_str = log_file.stem.split('_')[1]
                file_date = datetime.strptime(date_str, '%Y%m%d').replace(tzinfo=UTC_PLUS_8)

                if file_date < cutoff_date:
                    log_file.unlink()
                    logging.info(f"Deleted old log file: {log_file}")
            except Exception as e:
                logging.error(f"Error cleaning up log file {log_file}: {e}")


def python_level_to_proto(level: int) -> domain_pb2.LogLevel:
    """Convert Python logging level to proto LogLevel"""
    if level >= logging.CRITICAL:
        return domain_pb2.CRITICAL
    elif level >= logging.ERROR:
        return domain_pb2.ERROR
    elif level >= logging.WARNING:
        return domain_pb2.WARNING
    elif level >= logging.INFO:
        return domain_pb2.INFO
    else:
        return domain_pb2.DEBUG


def proto_level_to_python(level: domain_pb2.LogLevel) -> int:
    """Convert proto LogLevel to Python logging level"""
    mapping = {
        domain_pb2.DEBUG: logging.DEBUG,
        domain_pb2.INFO: logging.INFO,
        domain_pb2.WARNING: logging.WARNING,
        domain_pb2.ERROR: logging.ERROR,
        domain_pb2.CRITICAL: logging.CRITICAL,
    }
    return mapping.get(level, logging.INFO)
