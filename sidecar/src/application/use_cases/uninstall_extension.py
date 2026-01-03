"""Uninstall Extension Use Case"""
import logging
from domain.repositories.extension_repository import ExtensionRepository
from application.services.extension_loader import ExtensionLoader


logger = logging.getLogger(__name__)


class UninstallExtensionUseCase:
    """Use case for uninstalling an extension"""

    def __init__(
        self,
        repository: ExtensionRepository,
        loader: ExtensionLoader
    ):
        self.repository = repository
        self.loader = loader

    def execute(self, pkg_name: str) -> None:
        """Execute the uninstall extension use case"""
        logger.info(f"Uninstalling extension: {pkg_name}")

        if not self.repository.exists(pkg_name):
            logger.warning(f"Extension {pkg_name} not found")
            return

        # Unload resolver from cache
        self.loader.unload_resolver(pkg_name)

        # Delete extension
        self.repository.delete(pkg_name)

        logger.info(f"Successfully uninstalled extension: {pkg_name}")
