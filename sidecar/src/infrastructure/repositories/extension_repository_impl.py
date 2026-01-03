"""Extension Repository Implementation"""
import logging
from pathlib import Path
from typing import List, Optional

from domain.entities.extension import Extension
from domain.repositories.extension_repository import ExtensionRepository
from infrastructure.file_system.extension_file_manager import ExtensionFileManager


logger = logging.getLogger(__name__)


class ExtensionRepositoryImpl(ExtensionRepository):
    """File-based implementation of Extension Repository"""

    def __init__(self, file_manager: ExtensionFileManager):
        self.file_manager = file_manager

    def find_by_pkg_name(self, pkg_name: str) -> Optional[Extension]:
        """Find extension by package name"""
        metadata = self.file_manager.load_metadata(pkg_name)
        if not metadata:
            return None

        installation_path = self.file_manager.get_extension_path(pkg_name)
        return Extension(
            metadata=metadata,
            installation_path=installation_path,
            is_installed=True
        )

    def find_all(self) -> List[Extension]:
        """Find all installed extensions"""
        extensions = []
        for pkg_name in self.file_manager.list_extension_dirs():
            extension = self.find_by_pkg_name(pkg_name)
            if extension:
                extensions.append(extension)
        return extensions

    def save(self, extension: Extension) -> None:
        """Save extension metadata"""
        self.file_manager.save_metadata(extension.metadata)
        logger.info(f"Saved extension: {extension.pkg_name}")

    def delete(self, pkg_name: str) -> None:
        """Delete extension"""
        self.file_manager.delete_extension(pkg_name)
        logger.info(f"Deleted extension: {pkg_name}")

    def exists(self, pkg_name: str) -> bool:
        """Check if extension exists"""
        return self.file_manager.extension_exists(pkg_name)
