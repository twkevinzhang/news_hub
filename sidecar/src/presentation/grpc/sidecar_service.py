"""gRPC Service Implementation"""
import logging
import asyncio
import sidecar_api_pb2 as pb2
import sidecar_api_pb2_grpc as pb2_grpc
import grpc

from domain.value_objects.extension_metadata import ExtensionMetadata
from application.use_cases.install_extension import InstallExtensionUseCase
from application.use_cases.uninstall_extension import UninstallExtensionUseCase
from application.use_cases.list_installed_extensions import ListInstalledExtensionsUseCase
from application.use_cases.list_remote_extensions import ListRemoteExtensionsUseCase
from application.use_cases.get_installed_extension import GetInstalledExtensionUseCase
from application.use_cases.add_repo import AddRepoUseCase
from application.use_cases.remove_repo import RemoveRepoUseCase
from application.services.extension_loader import ExtensionLoader
from domain.repositories.extension_repository import ExtensionRepository
from domain.repositories.repo_repository import RepoRepository
from infrastructure.health_check_service import HealthCheckService
from infrastructure.logging_service import LoggingService, python_level_to_proto, proto_level_to_python


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
        add_repo_uc: AddRepoUseCase,
        remove_repo_uc: RemoveRepoUseCase,
        extension_loader: ExtensionLoader,
        extension_repository: ExtensionRepository,
        repo_repository: RepoRepository,
        health_check_service: HealthCheckService,
        logging_service: LoggingService
    ):
        self.install_extension_uc = install_extension_uc
        self.uninstall_extension_uc = uninstall_extension_uc
        self.list_installed_uc = list_installed_uc
        self.list_remote_uc = list_remote_uc
        self.get_installed_uc = get_installed_uc
        self.add_repo_uc = add_repo_uc
        self.remove_repo_uc = remove_repo_uc
        self.extension_loader = extension_loader
        self.extension_repository = extension_repository
        self.repo_repository = repo_repository
        self.health_check_service = health_check_service
        self.logging_service = logging_service

    async def ListInstalledExtensions(self, request, context):
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

    async def GetInstalledExtension(self, request, context):
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

    async def InstallExtension(self, request, context):
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
            # This involves network/IO, ideally should be async but use_case is sync
            loop = asyncio.get_event_loop()
            await loop.run_in_executor(None, self.install_extension_uc.execute, metadata)
            return pb2.Empty()
        except Exception as e:
            logger.error(f"InstallExtension error: {e}", exc_info=True)
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return pb2.Empty()

    async def UninstallExtension(self, request, context):
        """Uninstall an extension"""
        try:
            self.uninstall_extension_uc.execute(request.pkg_name)
            return pb2.Empty()
        except Exception as e:
            logger.error(f"UninstallExtension error: {e}", exc_info=True)
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return pb2.Empty()

    async def ListRemoteExtensions(self, request, context):
        """List available remote extensions"""
        try:
            # UC involves network IO, run in executor
            loop = asyncio.get_event_loop()
            extensions = await loop.run_in_executor(None, self.list_remote_uc.execute, request.keyword)
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

    async def GetInstallProgress(self, request, context):
        """Get installation progress (placeholder)"""
        return pb2.GetInstallProgressRes(sites=[])

    async def AddExtensionRepo(self, request, context):
        """Add a new extension repository"""
        try:
            loop = asyncio.get_event_loop()
            repo = await loop.run_in_executor(None, self.add_repo_uc.execute, request.url)
            return pb2.AddExtensionRepoRes(
                url=repo.url,
                added_at=int(repo.added_at.timestamp() * 1000),
                display_name=repo.display_name,
                website=repo.website,
                signing_key_fingerprint=repo.signing_key_fingerprint,
                icon=repo.icon if repo.icon else ""
            )
        except ValueError as e:
            logger.warning(f"AddExtensionRepo validation error: {e}")
            context.set_code(grpc.StatusCode.INVALID_ARGUMENT)
            context.set_details(str(e))
            return pb2.AddExtensionRepoRes()
        except Exception as e:
            logger.error(f"AddExtensionRepo error: {e}", exc_info=True)
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return pb2.AddExtensionRepoRes()

    async def RemoveExtensionRepo(self, request, context):
        """Remove an extension repository"""
        try:
            self.remove_repo_uc.execute(request.url)
            return pb2.Empty()
        except ValueError as e:
            logger.warning(f"RemoveExtensionRepo validation error: {e}")
            context.set_code(grpc.StatusCode.NOT_FOUND)
            context.set_details(str(e))
            return pb2.Empty()
        except Exception as e:
            logger.error(f"RemoveExtensionRepo error: {e}", exc_info=True)
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return pb2.Empty()

    async def ListExtensionRepos(self, request, context):
        """List all extension repositories"""
        try:
            repos = self.repo_repository.find_all()
            pb_repos = [
                pb2.ExtensionRepo(
                    url=repo.url,
                    added_at=int(repo.added_at.timestamp() * 1000),
                    display_name=repo.display_name,
                    website=repo.website,
                    signing_key_fingerprint=repo.signing_key_fingerprint,
                    icon=repo.icon if repo.icon else ""
                )
                for repo in repos
            ]
            return pb2.ListExtensionReposRes(repos=pb_repos)
        except Exception as e:
            logger.error(f"ListExtensionRepos error: {e}", exc_info=True)
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return pb2.ListExtensionReposRes()

    async def GetSite(self, request, context):
        """Delegate to extension resolver"""
        return await self._delegate_to_resolver(request.pkg_name, "GetSite", request, context)

    async def GetBoards(self, request, context):
        """Delegate to extension resolver"""
        return await self._delegate_to_resolver(request.pkg_name, "GetBoards", request, context)

    async def GetThreadInfos(self, request, context):
        """Delegate to extension resolver"""
        return await self._delegate_to_resolver(request.pkg_name, "GetThreadInfos", request, context)

    async def GetThreadPost(self, request, context):
        """Delegate to extension resolver"""
        return await self._delegate_to_resolver(request.pkg_name, "GetThreadPost", request, context)

    async def GetRegardingPosts(self, request, context):
        """Delegate to extension resolver"""
        return await self._delegate_to_resolver(request.pkg_name, "GetRegardingPosts", request, context)

    async def GetComments(self, request, context):
        """Delegate to extension resolver"""
        return await self._delegate_to_resolver(request.pkg_name, "GetComments", request, context)

    async def _delegate_to_resolver(self, pkg_name, method_name, request, context):
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
            
            # Extensions are likely synchronous, run in executor
            loop = asyncio.get_event_loop()
            return await loop.run_in_executor(None, method, request, context)
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

    # Health Check Methods
    async def HealthCheck(self, request, context):
        """Perform health check"""
        try:
            return self.health_check_service.check(request.service)
        except Exception as e:
            logger.error(f"HealthCheck error: {e}", exc_info=True)
            return pb2.HealthCheckResponse(
                status=pb2.HealthCheckResponse.UNKNOWN,
                message=str(e)
            )

    async def WatchHealth(self, request, context):
        """Stream health status changes"""
        last_status = None
        while True:
            try:
                status, message = self.health_check_service.get_status()
                
                # Correct message type based on proto definition
                current_result = pb2.HealthCheckRes(
                    status=status.value,
                    message=message or ""
                )

                if last_status != status:
                    last_status = status
                    yield current_result
                
                await asyncio.sleep(1)
            except Exception as e:
                logger.error(f"WatchHealth error: {e}", exc_info=True)
                break

    # Logs Methods
    async def WatchLogs(self, request, context):
        """Stream logs in real-time"""
        log_queue = None
        try:
            min_level = proto_level_to_python(request.min_level)
            log_queue = self.logging_service.subscribe_stream(min_level)
            
            while True:
                try:
                    # Wait for new log entry
                    entry = await log_queue.get()
                    
                    yield pb2.LogEntry(
                        timestamp=entry.timestamp,
                        level=python_level_to_proto(entry.level),
                        logger_name=entry.logger_name,
                        message=entry.message,
                        exception=entry.exception or ""
                    )
                except asyncio.CancelledError:
                    break
                except Exception as e:
                    logger.error(f"Error in WatchLogs loop: {e}")
                    break
        except Exception as e:
            logger.error(f"WatchLogs error: {e}", exc_info=True)
        finally:
            if log_queue:
                self.logging_service.unsubscribe_stream(log_queue)

    async def GetLogs(self, request, context):
        """Get historical logs"""
        try:
            min_level = proto_level_to_python(request.min_level)
            entries = self.logging_service.get_logs(
                start_time=request.start_time,
                end_time=request.end_time,
                min_level=min_level,
                limit=request.limit if request.limit > 0 else None
            )
            
            pb_entries = [
                pb2.LogEntry(
                    timestamp=entry.timestamp,
                    level=python_level_to_proto(entry.level),
                    logger_name=entry.logger_name,
                    message=entry.message,
                    exception=entry.exception or ""
                )
                for entry in entries
            ]
            
            return pb2.GetLogsResponse(entries=pb_entries)
        except Exception as e:
            logger.error(f"GetLogs error: {e}", exc_info=True)
            return pb2.GetLogsResponse()

    async def SetLogLevel(self, request, context):
        """Set log level"""
        try:
            level = proto_level_to_python(request.level)
            self.logging_service.set_level(level)
            return pb2.Empty()
        except Exception as e:
            logger.error(f"SetLogLevel error: {e}", exc_info=True)
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return pb2.Empty()
