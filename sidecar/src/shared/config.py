"""Configuration for the sidecar service"""
from pathlib import Path


class Config:
    """Configuration class"""

    # Directories
    BASE_DIR = Path(__file__).parent.parent
    EXTENSIONS_DIR = BASE_DIR / "extensions"
    DOWNLOAD_DIR = BASE_DIR / "download"
    LOG_DIR = BASE_DIR / "logs"

    # Server
    GRPC_PORT = 55001
    MAX_WORKERS = 1

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

