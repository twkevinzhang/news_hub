"""Extension Metadata Value Object"""
from dataclasses import dataclass
from typing import Optional


@dataclass(frozen=True)
class ExtensionMetadata:
    """Immutable value object representing extension metadata"""

    pkg_name: str
    display_name: str
    version: int
    python_version: int
    lang: Optional[str] = None
    is_nsfw: bool = False
    icon_url: Optional[str] = None

    def __post_init__(self):
        """Validate metadata"""
        if not self.pkg_name:
            raise ValueError("pkg_name cannot be empty")
        if not self.display_name:
            raise ValueError("display_name cannot be empty")
        if self.version < 0:
            raise ValueError("version must be non-negative")
        if self.python_version < 0:
            raise ValueError("python_version must be non-negative")
