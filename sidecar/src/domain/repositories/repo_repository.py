"""Repo Repository Interface"""
from abc import ABC, abstractmethod
from typing import List, Optional

from domain.entities.repo import Repo


class RepoRepository(ABC):
    """Repository interface for Repo entities"""

    @abstractmethod
    def add(self, repo: Repo) -> None:
        """Add a new repository"""
        pass

    @abstractmethod
    def remove(self, url: str) -> None:
        """Remove a repository by URL"""
        pass

    @abstractmethod
    def find_by_url(self, url: str) -> Optional[Repo]:
        """Find repository by URL"""
        pass

    @abstractmethod
    def find_all(self) -> List[Repo]:
        """Find all registered repositories"""
        pass

    @abstractmethod
    def exists(self, url: str) -> bool:
        """Check if repository exists"""
        pass
