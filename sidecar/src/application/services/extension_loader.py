"""Extension Loader Service"""
import importlib.util
import sys
import logging
from pathlib import Path
from typing import Optional


logger = logging.getLogger(__name__)


class ExtensionLoader:
    """Dynamically loads extension resolvers"""

    _loaded_resolvers = {}  # Cache loaded resolvers

    def load_resolver(self, pkg_name: str, extension_path: Path):
        """Load resolver from extension directory"""
        if pkg_name in self._loaded_resolvers:
            return self._loaded_resolvers[pkg_name]

        resolver_path = extension_path / "resolver_impl.py"
        if not resolver_path.exists():
            raise FileNotFoundError(f"Resolver not found: {resolver_path}")

        # Add extension directory to sys.path
        ext_dir_str = str(extension_path)
        if ext_dir_str not in sys.path:
            sys.path.insert(0, ext_dir_str)

        # Load module
        module_name = f"{pkg_name}_resolver"
        spec = importlib.util.spec_from_file_location(module_name, resolver_path)

        if not spec or not spec.loader:
            raise ImportError(f"Cannot load module from {resolver_path}")

        module = importlib.util.module_from_spec(spec)
        sys.modules[module_name] = module
        spec.loader.exec_module(module)

        # Get ResolverImpl class
        if not hasattr(module, "ResolverImpl"):
            raise AttributeError(f"Module {pkg_name} has no ResolverImpl class")

        resolver = module.ResolverImpl()
        self._loaded_resolvers[pkg_name] = resolver

        logger.info(f"Loaded resolver for {pkg_name}")
        return resolver

    def unload_resolver(self, pkg_name: str) -> None:
        """Unload resolver from cache"""
        if pkg_name in self._loaded_resolvers:
            del self._loaded_resolvers[pkg_name]
            logger.info(f"Unloaded resolver for {pkg_name}")

    def clear_cache(self) -> None:
        """Clear all loaded resolvers"""
        self._loaded_resolvers.clear()
        logger.info("Cleared resolver cache")
