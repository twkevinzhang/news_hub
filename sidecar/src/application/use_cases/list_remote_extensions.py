"""List Remote Extensions Use Case"""
import logging
from typing import List
from domain.value_objects.extension_metadata import ExtensionMetadata
from domain.repositories.repo_repository import RepoRepository
from domain.repositories.extension_repository import RemoteExtensionRepository


logger = logging.getLogger(__name__)


class ListRemoteExtensionsUseCase:
    """Use case for listing remote extensions from all registered repos"""

    def __init__(
        self,
        extension_repository: RemoteExtensionRepository,
        repo_repository: RepoRepository
    ):
        self.extension_repository = extension_repository
        self.repo_repository = repo_repository

    def execute(self, keyword: str = None) -> List[tuple[ExtensionMetadata, str]]:
        """Execute the list remote extensions use case"""
        logger.debug("Fetching remote extensions from all registered repositories")
        
        all_extensions = []
        repos = self.repo_repository.find_all()
        
        for repo in repos:
            try:
                extensions = self.extension_repository.fetch_all(repo.url)
                all_extensions.extend([(e, repo.url) for e in extensions])
            except Exception as e:
                logger.error(f"Failed to fetch extensions from {repo.url}: {e}")
                continue

        # Optional: Filter by keyword if provided
        if keyword:
            keyword = keyword.lower()
            all_extensions = [
                (e, url) for e, url in all_extensions
                if keyword in e.display_name.lower() or keyword in e.pkg_name.lower()
            ]

        logger.debug(f"Found total {len(all_extensions)} remote extensions")
        return all_extensions
