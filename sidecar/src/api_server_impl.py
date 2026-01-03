import os
import sys
import importlib.util
from pathlib import Path
import sidecar_api_pb2 as pb2
import sidecar_api_pb2_grpc as pb2_grpc


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


class ApiServerImpl(pb2_grpc.ExtensionApiServicer):
    def __init__(self):
        pass

    def GetSite(self, req: pb2.GetSiteReq, context) -> pb2.GetSiteRes:
        impl: pb2_grpc.ExtensionApiServicer = load_resolver(req.pkg_name)
        return impl.GetSite(req, context)

    def GetBoards(self, req: pb2.GetBoardsReq, context) -> pb2.GetBoardsRes:
        impl: pb2_grpc.ExtensionApiServicer = load_resolver(req.pkg_name)
        return impl.GetBoards(req, context)

    def GetThreadInfos(self, req: pb2.GetThreadInfosReq, context) -> pb2.GetThreadInfosRes:
        impl: pb2_grpc.ExtensionApiServicer = load_resolver(req.pkg_name)
        return impl.GetThreadInfos(req, context)

    def GetThreadPost(self, req: pb2.GetThreadPostReq, context) -> pb2.GetThreadPostRes:
        impl: pb2_grpc.ExtensionApiServicer = load_resolver(req.pkg_name)
        return impl.GetThreadPost(req, context)

    def GetRegardingPosts(self, req: pb2.GetRegardingPostsReq, context) -> pb2.GetRegardingPostsRes:
        impl: pb2_grpc.ExtensionApiServicer = load_resolver(req.pkg_name)
        return impl.GetRegardingPosts(req, context)

    def GetComments(self, req: pb2.GetCommentsReq, context) -> pb2.GetThreadInfosRes:
        impl: pb2_grpc.ExtensionApiServicer = load_resolver(req.pkg_name)
        return impl.GetComments(req, context)
