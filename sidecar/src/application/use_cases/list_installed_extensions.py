"""List Installed Extensions Use Case"""
import logging
from typing import List
from domain.entities.extension import Extension
from domain.repositories.extension_repository import ExtensionRepository


logger = logging.getLogger(__name__)


class ListInstalledExtensionsUseCase:
    """Use case for listing installed extensions"""

    def __init__(self, repository: ExtensionRepository):
        self.repository = repository

    def execute(self) -> List[Extension]:
        """Execute the list installed extensions use case"""
        logger.debug("Listing installed extensions")
        extensions = self.repository.find_all()
        logger.debug(f"Found {len(extensions)} installed extensions")
        return extensions
