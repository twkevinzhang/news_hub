import os
import sys
import importlib.util
import json
import shutil
import asyncio
from pathlib import Path
import sidecar_api_pb2 as pb2
import sidecar_api_pb2_grpc as pb2_grpc
from download_and_install import download_zip, unzip_file, install_requirements


# 動態載入模組
def load_module_from_path(file_path: str):
    # 確保檔案存在
    if not Path(file_path).exists():
        raise FileNotFoundError(f"file {file_path} not found")
    module_name = "dynamic_script"
    spec = importlib.util.spec_from_file_location(module_name, file_path)
    if spec and spec.loader:
        module = importlib.util.module_from_spec(spec)
        sys.modules[module_name] = module
        spec.loader.exec_module(module)
        return module
    else:
        raise ImportError(f"can't load module {module_name} from {file_path}")

def load_resolver(pkg_name: str):
    sys.path.append(os.path.abspath(f"./extensions/{pkg_name}"))
    mod = load_module_from_path(f"./extensions/{pkg_name}/resolver_impl.py")
    # 確保 `ResolverImpl` 類別存在
    if not hasattr(mod, "ResolverImpl"):
        raise AttributeError(f"module {pkg_name} has no ResolverImpl class")
    return mod.ResolverImpl()


class ApiServerImpl(pb2_grpc.SidecarApiServicer):
    def __init__(self):
        self.extensions_dir = Path("./extensions")
        self.extensions_dir.mkdir(exist_ok=True)

    def _get_extension_metadata(self, pkg_name):
        meta_path = self.extensions_dir / pkg_name / "metadata.json"
        if meta_path.exists():
            try:
                with open(meta_path, "r", encoding="utf-8") as f:
                    return json.load(f)
            except:
                pass
        return None

    def ListInstalledExtensions(self, req, context):
        extensions = []
        for d in self.extensions_dir.iterdir():
            if d.is_dir():
                meta = self._get_extension_metadata(d.name)
                if meta:
                    extensions.append(pb2.Extension(
                        repo_base_url=meta.get("repo_base_url", ""),
                        pkg_name=d.name,
                        display_name=meta.get("display_name", d.name),
                        zip_name=meta.get("zip_name", ""),
                        version=meta.get("version", 0),
                        python_version=meta.get("python_version", 0),
                        lang=meta.get("lang"),
                        is_nsfw=meta.get("is_nsfw", False)
                    ))
        return pb2.ListInstalledExtensionsRes(extensions=extensions)

    def GetInstalledExtension(self, req, context):
        meta = self._get_extension_metadata(req.pkg_name)
        if meta:
             return pb2.GetInstalledExtensionRes(extension=pb2.Extension(
                        repo_base_url=meta.get("repo_base_url", ""),
                        pkg_name=req.pkg_name,
                        display_name=meta.get("display_name", req.pkg_name),
                        zip_name=meta.get("zip_name", ""),
                        version=meta.get("version", 0),
                        python_version=meta.get("python_version", 0),
                        lang=meta.get("lang"),
                        is_nsfw=meta.get("is_nsfw", False)
                    ))
        context.set_code(pb2_grpc.grpc.StatusCode.NOT_FOUND)
        context.set_details(f"Extension {req.pkg_name} not found")
        return pb2.GetInstalledExtensionRes()

    def InstallExtension(self, req, context):
        url = f"{req.repo_base_url}/{req.zip_name}"
        try:
            # Run async code in a synchronous context
            asyncio.run(download_zip(url, req.pkg_name))
            unzip_file(req.pkg_name)
            install_requirements(req.pkg_name)
            
            # Store metadata
            meta = {
                "repo_base_url": req.repo_base_url,
                "pkg_name": req.pkg_name,
                "zip_name": req.zip_name,
                "display_name": req.pkg_name, # FIXME
                "version": 1, # FIXME
                "python_version": 3, # FIXME
            }
            meta_path = self.extensions_dir / req.pkg_name / "metadata.json"
            with open(meta_path, "w", encoding="utf-8") as f:
                json.dump(meta, f)
                
            return pb2.Empty()
        except Exception as e:
            context.set_code(pb2_grpc.grpc.StatusCode.INTERNAL)
            context.set_details(str(e))
            return pb2.Empty()

    def UninstallExtension(self, req, context):
        dist = self.extensions_dir / req.pkg_name
        if dist.exists():
            shutil.rmtree(dist)
        return pb2.Empty()

    def GetInstallProgress(self, req, context):
        # Placeholder
        return pb2.GetInstallProgressRes(sites=[])

    def ListRemoteExtensions(self, req, context):
        # Placeholder: fetch index.json from req.repo_base_url
        import requests
        try:
            r = requests.get(f"{req.repo_base_url}/index.json", timeout=10)
            r.raise_for_status()
            data = r.json()
            remotes = []
            for item in data.get("extensions", []):
                remotes.append(pb2.RemoteExtension(
                    base=pb2.Extension(
                        repo_base_url=req.repo_base_url,
                        pkg_name=item["pkg_name"],
                        display_name=item["display_name"],
                        zip_name=item["zip_name"],
                        version=item["version"],
                        python_version=item.get("python_version", 3),
                        lang=item.get("lang"),
                        is_nsfw=item.get("is_nsfw", False)
                    ),
                    icon_url=item.get("icon_url", ""),
                    repo_url=item.get("repo_url", "")
                ))
            return pb2.ListRemoteExtensionsRes(extensions=remotes)
        except Exception as e:
            # Return empty if failed
            return pb2.ListRemoteExtensionsRes(extensions=[])

    def GetSite(self, req: pb2.GetSiteReq, context) -> pb2.GetSiteRes:
        impl = load_resolver(req.pkg_name)
        return impl.GetSite(req, context)

    def GetBoards(self, req: pb2.GetBoardsReq, context) -> pb2.GetBoardsRes:
        impl = load_resolver(req.pkg_name)
        return impl.GetBoards(req, context)

    def GetThreadInfos(self, req: pb2.GetThreadInfosReq, context) -> pb2.GetThreadInfosRes:
        impl = load_resolver(req.pkg_name)
        return impl.GetThreadInfos(req, context)

    def GetThreadPost(self, req: pb2.GetThreadPostReq, context) -> pb2.GetThreadPostRes:
        impl = load_resolver(req.pkg_name)
        return impl.GetThreadPost(req, context)

    def GetRegardingPosts(self, req: pb2.GetRegardingPostsReq, context) -> pb2.GetRegardingPostsRes:
        impl = load_resolver(req.pkg_name)
        return impl.GetRegardingPosts(req, context)

    def GetComments(self, req: pb2.GetCommentsReq, context) -> pb2.GetCommentsRes:
        impl = load_resolver(req.pkg_name)
        return impl.GetComments(req, context)
