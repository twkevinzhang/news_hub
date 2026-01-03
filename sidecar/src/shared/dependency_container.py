"""Dependency Injection Container"""
from shared.config import Config
from infrastructure.downloaders.http_downloader import HttpDownloader
from infrastructure.file_system.extension_file_manager import ExtensionFileManager
from infrastructure.repositories.extension_repository_impl import ExtensionRepositoryImpl
from infrastructure.repositories.remote_extension_repository_impl import RemoteExtensionRepositoryImpl
from infrastructure.health_check_service import HealthCheckService, HealthStatus
from infrastructure.logging_service import LoggingService
from application.services.extension_installer import ExtensionInstaller
from application.services.extension_loader import ExtensionLoader
from application.use_cases.install_extension import InstallExtensionUseCase
from application.use_cases.uninstall_extension import UninstallExtensionUseCase
from application.use_cases.list_installed_extensions import ListInstalledExtensionsUseCase
from application.use_cases.list_remote_extensions import ListRemoteExtensionsUseCase
from application.use_cases.get_installed_extension import GetInstalledExtensionUseCase
from application.use_cases.add_repo import AddRepoUseCase
from application.use_cases.remove_repo import RemoveRepoUseCase
from infrastructure.repositories.repo_repository_impl import RepoRepositoryImpl
from presentation.grpc.sidecar_service import SidecarService


class DependencyContainer:
    """Container for dependency injection"""

    def __init__(self):
        # Ensure directories exist
        Config.ensure_directories()

        # Infrastructure - Logging (must be first)
        self.logging_service = LoggingService(
            log_dir=Config.LOG_DIR,
            retention_days=Config.LOG_RETENTION_DAYS
        )

        # Infrastructure - Health Check
        self.health_check_service = HealthCheckService()
        self.health_check_service.set_status(HealthStatus.SERVING, "Initializing...")

        # Infrastructure - Others
        self.http_downloader = HttpDownloader(timeout=Config.DOWNLOAD_TIMEOUT)
        self.file_manager = ExtensionFileManager(
            extensions_dir=Config.EXTENSIONS_DIR,
            download_dir=Config.DOWNLOAD_DIR
        )

        # Repositories
        self.extension_repository = ExtensionRepositoryImpl(self.file_manager)
        self.remote_extension_repository = RemoteExtensionRepositoryImpl(
            self.http_downloader
        )
        self.repo_repository = RepoRepositoryImpl(
            persistent_dir=Config.PERSISTENT_DIR
        )

        # Application Services
        self.extension_installer = ExtensionInstaller(
            downloader=self.http_downloader,
            file_manager=self.file_manager
        )
        self.extension_loader = ExtensionLoader()

        # Use Cases
        self.install_extension_uc = InstallExtensionUseCase(
            repository=self.extension_repository,
            installer=self.extension_installer
        )
        self.uninstall_extension_uc = UninstallExtensionUseCase(
            repository=self.extension_repository,
            loader=self.extension_loader
        )
        self.list_installed_uc = ListInstalledExtensionsUseCase(
            repository=self.extension_repository
        )
        self.list_remote_uc = ListRemoteExtensionsUseCase(
            repository=self.remote_extension_repository
        )
        self.get_installed_uc = GetInstalledExtensionUseCase(
            repository=self.extension_repository
        )
        self.add_repo_uc = AddRepoUseCase(
            repository=self.repo_repository,
            downloader=self.http_downloader
        )
        self.remove_repo_uc = RemoveRepoUseCase(
            repository=self.repo_repository
        )

        # Presentation
        self.sidecar_service = SidecarService(
            install_extension_uc=self.install_extension_uc,
            uninstall_extension_uc=self.uninstall_extension_uc,
            list_installed_uc=self.list_installed_uc,
            list_remote_uc=self.list_remote_uc,
            get_installed_uc=self.get_installed_uc,
            extension_loader=self.extension_loader,
            extension_repository=self.extension_repository,
            health_check_service=self.health_check_service,
            logging_service=self.logging_service
        )

        # Mark as fully initialized
        self.health_check_service.set_status(HealthStatus.SERVING, "Ready")

