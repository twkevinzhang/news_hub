"""Progress Tracker Service"""
import logging
from threading import Lock
from typing import Dict


logger = logging.getLogger(__name__)


class ProgressTracker:
    """Tracks progress of asynchronous operations"""

    def __init__(self):
        self._progress: Dict[str, int] = {}
        self._lock = Lock()

    def set_progress(self, key: str, progress: int) -> None:
        """Set progress for a key (0-100)"""
        with self._lock:
            self._progress[key] = max(0, min(100, progress))
            if progress >= 100:
                # Keep it for a while or let it be cleaned up
                pass

    def get_progress(self, key: str) -> int:
        """Get progress for a key"""
        with self._lock:
            return self._progress.get(key, 0)

    def remove_progress(self, key: str) -> None:
        """Remove progress for a key"""
        with self._lock:
            if key in self._progress:
                del self._progress[key]
