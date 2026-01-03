"""Get Installed Extension Use Case"""
import logging
from typing import Optional
from domain.entities.extension import Extension
from domain.repositories.extension_repository import ExtensionRepository


logger = logging.getLogger(__name__)


class GetInstalledExtensionUseCase:
    """Use case for getting a single installed extension"""

    def __init__(self, repository: ExtensionRepository):
        self.repository = repository

    def execute(self, pkg_name: str) -> Optional[Extension]:
        """Execute the get installed extension use case"""
        logger.debug(f"Getting installed extension: {pkg_name}")
        extension = self.repository.find_by_pkg_name(pkg_name)

        if extension:
            logger.debug(f"Found extension: {pkg_name}")
        else:
            logger.warning(f"Extension not found: {pkg_name}")

        return extension
