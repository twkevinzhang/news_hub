"""Extension Entity"""
from dataclasses import dataclass
from pathlib import Path
from typing import Optional
from domain.value_objects.extension_metadata import ExtensionMetadata


@dataclass
class Extension:
    """Extension entity representing an installed extension"""

    metadata: ExtensionMetadata
    installation_path: Path
    is_installed: bool = False

    @property
    def pkg_name(self) -> str:
        """Get package name"""
        return self.metadata.pkg_name

    @property
    def display_name(self) -> str:
        """Get display name"""
        return self.metadata.display_name

    @property
    def version(self) -> int:
        """Get version"""
        return self.metadata.version

    def mark_as_installed(self) -> None:
        """Mark extension as installed"""
        self.is_installed = True

    def mark_as_uninstalled(self) -> None:
        """Mark extension as uninstalled"""
        self.is_installed = False

    def get_resolver_path(self) -> Path:
        """Get resolver implementation path"""
        return self.installation_path / "resolver_impl.py"

    def get_metadata_file_path(self) -> Path:
        """Get metadata file path"""
        return self.installation_path / "metadata.json"
