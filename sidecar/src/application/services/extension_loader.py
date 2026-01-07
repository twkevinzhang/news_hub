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

        # Standard Package Structure:
        # extension_path/
        #   {pkg_name}/
        #     __init__.py
        #     resolver_impl.py

        # Add extension directory to sys.path
        ext_dir_str = str(extension_path)
        if ext_dir_str not in sys.path:
            sys.path.insert(0, ext_dir_str)

        module_name = f"{pkg_name}.resolver_impl"
        try:
            # Use standard import mechanism
            # This allows relative imports inside the extension package to work correctly
            if module_name in sys.modules:
                # Reload if already loaded (useful for development/updates)
                module = importlib.reload(sys.modules[module_name])
            else:
                module = importlib.import_module(module_name)
        except ImportError as e:
            logger.error(f"Failed to import module {module_name}: {e}")
            raise ImportError(f"Cannot load module {module_name} from {extension_path}: {e}")
        except Exception as e:
            logger.error(f"Unexpected error loading module {module_name}: {e}")
            raise e

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
