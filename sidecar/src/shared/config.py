"""Configuration for the sidecar service"""
import sys
from pathlib import Path


class Config:
    """Configuration class"""

    # Directories
    # Use sys.executable to get the directory where the exe/binary is located
    # This works for both development (python script) and production (packaged exe)
    BASE_DIR = Path(sys.executable).parent if getattr(sys, 'frozen', False) else Path(__file__).parent.parent.parent
    EXTENSIONS_DIR = BASE_DIR / "extensions"
    DOWNLOAD_DIR = BASE_DIR / "download"
    LOG_DIR = BASE_DIR / "logs"
    PERSISTENT_DIR = BASE_DIR / "persistent"

    # Server
    GRPC_PORT = 55001
    MAX_WORKERS = 5

    # Download
    DOWNLOAD_TIMEOUT = 30  # seconds

    # Logging
    LOG_RETENTION_DAYS = 7  # Default retention period
    DEFAULT_LOG_LEVEL = "INFO"

    @classmethod
    def ensure_directories(cls):
        """Ensure required directories exist"""
        cls.EXTENSIONS_DIR.mkdir(exist_ok=True)
        cls.DOWNLOAD_DIR.mkdir(exist_ok=True)
        cls.LOG_DIR.mkdir(exist_ok=True)
        cls.PERSISTENT_DIR.mkdir(exist_ok=True)

