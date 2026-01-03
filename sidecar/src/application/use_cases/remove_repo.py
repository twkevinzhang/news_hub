"""Remove Repo Use Case"""
import logging

from domain.repositories.repo_repository import RepoRepository


logger = logging.getLogger(__name__)


class RemoveRepoUseCase:
    """Use case for removing a repository"""

    def __init__(self, repository: RepoRepository):
        self.repository = repository

    def execute(self, url: str) -> None:
        """
        Execute the remove repo use case

        Args:
            url: GitHub repository URL to remove

        Raises:
            ValueError: If repository doesn't exist
        """
        logger.info(f"Removing repository: {url}")

        if not self.repository.exists(url):
            raise ValueError(f"Repository not found: {url}")

        self.repository.remove(url)
        logger.info(f"Successfully removed repository: {url}")
