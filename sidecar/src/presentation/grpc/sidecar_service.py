"""gRPC Service Implementation"""
import logging
import sidecar_api_pb2 as pb2
import sidecar_api_pb2_grpc as pb2_grpc
import grpc

from domain.value_objects.extension_metadata import ExtensionMetadata
from application.use_cases.install_extension import InstallExtensionUseCase
from application.use_cases.uninstall_extension import UninstallExtensionUseCase
from application.use_cases.list_installed_extensions import ListInstalledExtensionsUseCase
from application.use_cases.list_remote_extensions import ListRemoteExtensionsUseCase
from application.use_cases.get_installed_extension import GetInstalledExtensionUseCase
from application.services.extension_loader import ExtensionLoader
from domain.repositories.extension_repository import ExtensionRepository


logger = logging.getLogger(__name__)


class SidecarService(pb2_grpc.SidecarApiServicer):
    """gRPC Service for Sidecar API"""

    def __init__(
        self,
        install_extension_uc: InstallExtensionUseCase,
        uninstall_extension_uc: UninstallExtensionUseCase,
        list_installed_uc: ListInstalledExtensionsUseCase,
        list_remote_uc: ListRemoteExtensionsUseCase,
        get_installed_uc: GetInstalledExtensionUseCase,
        extension_loader: ExtensionLoader,
        extension_repository: ExtensionRepository
    ):
        self.install_extension_uc = install_extension_uc
        self.uninstall_extension_uc = uninstall_extension_uc
        self.list_installed_uc = list_installed_uc
        self.list_remote_uc = list_remote_uc
        self.get_installed_uc = get_installed_uc
        self.extension_loader = extension_loader
        self.extension_repository = extension_repository

    def ListInstalledExtensions(self, request, context):
        """List all installed extensions"""
        try:
            extensions = self.list_installed_uc.execute()
            pb_extensions = [
                self._extension_to_pb(ext) for ext in extensions
            ]
            return pb2.ListInstalledExtensionsRes(extensions=pb_extensions)
        except Exception as e:
            logger.error(f"ListInstalledExtensions error: {e}", exc_info=True)
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return pb2.ListInstalledExtensionsRes()

    def GetInstalledExtension(self, request, context):
        """Get a single installed extension"""
        try:
            extension = self.get_installed_uc.execute(request.pkg_name)
            if not extension:
                context.set_code(grpc.StatusCode.NOT_FOUND)
                context.set_details(f"Extension {request.pkg_name} not found")
                return pb2.GetInstalledExtensionRes()

            return pb2.GetInstalledExtensionRes(
                extension=self._extension_to_pb(extension)
            )
        except Exception as e:
            logger.error(f"GetInstalledExtension error: {e}", exc_info=True)
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return pb2.GetInstalledExtensionRes()

    def InstallExtension(self, request, context):
        """Install an extension"""
        try:
            metadata = ExtensionMetadata(
                repo_base_url=request.repo_base_url,
                pkg_name=request.pkg_name,
                display_name=request.pkg_name,  # Will be updated from extension
                zip_name=request.zip_name,
                version=1,
                python_version=3,
            )
            self.install_extension_uc.execute(metadata)
            return pb2.Empty()
        except Exception as e:
            logger.error(f"InstallExtension error: {e}", exc_info=True)
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return pb2.Empty()

    def UninstallExtension(self, request, context):
        """Uninstall an extension"""
        try:
            self.uninstall_extension_uc.execute(request.pkg_name)
            return pb2.Empty()
        except Exception as e:
            logger.error(f"UninstallExtension error: {e}", exc_info=True)
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return pb2.Empty()

    def ListRemoteExtensions(self, request, context):
        """List available remote extensions"""
        try:
            extensions = self.list_remote_uc.execute(request.repo_base_url)
            pb_extensions = [
                pb2.RemoteExtension(
                    base=pb2.Extension(
                        repo_base_url=ext.repo_base_url,
                        pkg_name=ext.pkg_name,
                        display_name=ext.display_name,
                        zip_name=ext.zip_name,
                        version=ext.version,
                        python_version=ext.python_version,
                        lang=ext.lang,
                        is_nsfw=ext.is_nsfw
                    ),
                    icon_url=ext.icon_url or "",
                    repo_url=ext.repo_url or ""
                )
                for ext in extensions
            ]
            return pb2.ListRemoteExtensionsRes(extensions=pb_extensions)
        except Exception as e:
            logger.error(f"ListRemoteExtensions error: {e}", exc_info=True)
            return pb2.ListRemoteExtensionsRes()

    def GetInstallProgress(self, request, context):
        """Get installation progress (placeholder)"""
        return pb2.GetInstallProgressRes(sites=[])

    def GetSite(self, request, context):
        """Delegate to extension resolver"""
        return self._delegate_to_resolver(request.pkg_name, "GetSite", request, context)

    def GetBoards(self, request, context):
        """Delegate to extension resolver"""
        return self._delegate_to_resolver(request.pkg_name, "GetBoards", request, context)

    def GetThreadInfos(self, request, context):
        """Delegate to extension resolver"""
        return self._delegate_to_resolver(request.pkg_name, "GetThreadInfos", request, context)

    def GetThreadPost(self, request, context):
        """Delegate to extension resolver"""
        return self._delegate_to_resolver(request.pkg_name, "GetThreadPost", request, context)

    def GetRegardingPosts(self, request, context):
        """Delegate to extension resolver"""
        return self._delegate_to_resolver(request.pkg_name, "GetRegardingPosts", request, context)

    def GetComments(self, request, context):
        """Delegate to extension resolver"""
        return self._delegate_to_resolver(request.pkg_name, "GetComments", request, context)

    def _delegate_to_resolver(self, pkg_name, method_name, request, context):
        """Delegate method call to extension resolver"""
        try:
            extension = self.extension_repository.find_by_pkg_name(pkg_name)
            if not extension:
                context.set_code(grpc.StatusCode.NOT_FOUND)
                context.set_details(f"Extension {pkg_name} not found")
                return None

            resolver = self.extension_loader.load_resolver(
                pkg_name,
                extension.installation_path
            )
            method = getattr(resolver, method_name)
            return method(request, context)
        except Exception as e:
            logger.error(f"{method_name} error: {e}", exc_info=True)
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return None

    @staticmethod
    def _extension_to_pb(extension):
        """Convert Extension entity to protobuf"""
        return pb2.Extension(
            repo_base_url=extension.metadata.repo_base_url,
            pkg_name=extension.metadata.pkg_name,
            display_name=extension.metadata.display_name,
            zip_name=extension.metadata.zip_name,
            version=extension.metadata.version,
            python_version=extension.metadata.python_version,
            lang=extension.metadata.lang,
            is_nsfw=extension.metadata.is_nsfw
        )
