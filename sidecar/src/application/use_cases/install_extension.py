"""Install Extension Use Case"""
import logging
from domain.entities.extension import Extension
from domain.repositories.extension_repository import ExtensionRepository
from domain.value_objects.extension_metadata import ExtensionMetadata
from application.services.extension_installer import ExtensionInstaller


logger = logging.getLogger(__name__)


class InstallExtensionUseCase:
    """Use case for installing an extension"""

    def __init__(
        self,
        repository: ExtensionRepository,
        installer: ExtensionInstaller
    ):
        self.repository = repository
        self.installer = installer

    def execute(self, metadata: ExtensionMetadata, repo_url: str = "") -> Extension:
        """Execute the install extension use case"""
        logger.info(f"Installing extension: {metadata.pkg_name}")

        if self.repository.exists(metadata.pkg_name):
            logger.warning(f"Extension {metadata.pkg_name} already installed")
            existing = self.repository.find_by_pkg_name(metadata.pkg_name)
            if existing:
                return existing

        self.installer.download_directory(repo_url, metadata.pkg_name)
        self.installer.install_requirements(metadata.pkg_name)

        extension = Extension(
            metadata=metadata,
            installation_path=self.installer.file_manager.get_extension_path(metadata.pkg_name),
            is_installed=True
        )
        self.repository.save(extension)
        self.installer.progress_tracker.set_progress(metadata.pkg_name, 100)

        logger.info(f"Successfully installed extension: {metadata.pkg_name}")
        return extension
