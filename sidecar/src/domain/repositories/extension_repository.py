"""Extension Repository Interface"""
from abc import ABC, abstractmethod
from typing import List, Optional
from domain.entities.extension import Extension
from domain.value_objects.extension_metadata import ExtensionMetadata


class ExtensionRepository(ABC):
    """Repository interface for Extension entities"""

    @abstractmethod
    def find_by_pkg_name(self, pkg_name: str) -> Optional[Extension]:
        """Find extension by package name"""
        pass

    @abstractmethod
    def find_all(self) -> List[Extension]:
        """Find all installed extensions"""
        pass

    @abstractmethod
    def save(self, extension: Extension) -> None:
        """Save extension"""
        pass

    @abstractmethod
    def delete(self, pkg_name: str) -> None:
        """Delete extension by package name"""
        pass

    @abstractmethod
    def exists(self, pkg_name: str) -> bool:
        """Check if extension exists"""
        pass


class RemoteExtensionRepository(ABC):
    """Repository interface for remote extensions"""

    @abstractmethod
    def fetch_all(self, repo_base_url: str) -> List[ExtensionMetadata]:
        """Fetch all available extensions from remote repository"""
        pass
