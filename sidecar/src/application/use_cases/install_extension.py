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

    def execute(self, metadata: ExtensionMetadata) -> Extension:
        """Execute the install extension use case"""
        logger.info(f"Installing extension: {metadata.pkg_name}")

        # Check if already installed
        if self.repository.exists(metadata.pkg_name):
            logger.warning(f"Extension {metadata.pkg_name} already installed")
            existing = self.repository.find_by_pkg_name(metadata.pkg_name)
            if existing:
                return existing

        # Download extension
        url = f"{metadata.repo_base_url}/{metadata.zip_name}"
        self.installer.download(url, metadata.pkg_name)

        # Extract
        self.installer.extract(metadata.pkg_name)

        # Install requirements
        self.installer.install_requirements(metadata.pkg_name)

        # Create and save extension entity
        extension = Extension(
            metadata=metadata,
            installation_path=self.installer.file_manager.get_extension_path(metadata.pkg_name),
            is_installed=True
        )
        self.repository.save(extension)

        logger.info(f"Successfully installed extension: {metadata.pkg_name}")
        return extension
