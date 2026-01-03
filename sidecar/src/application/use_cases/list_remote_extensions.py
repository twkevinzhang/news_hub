"""List Remote Extensions Use Case"""
import logging
from typing import List
from domain.value_objects.extension_metadata import ExtensionMetadata
from domain.repositories.extension_repository import RemoteExtensionRepository


logger = logging.getLogger(__name__)


class ListRemoteExtensionsUseCase:
    """Use case for listing remote extensions"""

    def __init__(self, repository: RemoteExtensionRepository):
        self.repository = repository

    def execute(self, repo_base_url: str) -> List[ExtensionMetadata]:
        """Execute the list remote extensions use case"""
        logger.debug(f"Fetching remote extensions from {repo_base_url}")
        extensions = self.repository.fetch_all(repo_base_url)
        logger.debug(f"Found {len(extensions)} remote extensions")
        return extensions
