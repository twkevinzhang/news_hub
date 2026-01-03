"""File system operations for extensions"""
import json
import shutil
import zipfile
from pathlib import Path
from typing import Optional
import logging

from domain.value_objects.extension_metadata import ExtensionMetadata


logger = logging.getLogger(__name__)


class ExtensionFileManager:
    """Handles file system operations for extensions"""

    def __init__(self, extensions_dir: Path, download_dir: Path):
        self.extensions_dir = extensions_dir
        self.download_dir = download_dir

    def get_extension_path(self, pkg_name: str) -> Path:
        """Get extension installation path"""
        return self.extensions_dir / pkg_name

    def get_download_path(self, pkg_name: str) -> Path:
        """Get download path for extension zip"""
        return self.download_dir / f"{pkg_name}.zip"

    def load_metadata(self, pkg_name: str) -> Optional[ExtensionMetadata]:
        """Load extension metadata from file"""
        meta_path = self.get_extension_path(pkg_name) / "metadata.json"
        if not meta_path.exists():
            return None

        try:
            with open(meta_path, "r", encoding="utf-8") as f:
                data = json.load(f)
                return ExtensionMetadata(
                    repo_base_url=data.get("repo_base_url", ""),
                    pkg_name=pkg_name,
                    display_name=data.get("display_name", pkg_name),
                    zip_name=data.get("zip_name", ""),
                    version=data.get("version", 0),
                    python_version=data.get("python_version", 3),
                    lang=data.get("lang"),
                    is_nsfw=data.get("is_nsfw", False),
                )
        except (json.JSONDecodeError, KeyError) as e:
            logger.error(f"Failed to load metadata for {pkg_name}: {e}")
            return None

    def save_metadata(self, metadata: ExtensionMetadata) -> None:
        """Save extension metadata to file"""
        meta_path = self.get_extension_path(metadata.pkg_name) / "metadata.json"
        data = {
            "repo_base_url": metadata.repo_base_url,
            "pkg_name": metadata.pkg_name,
            "display_name": metadata.display_name,
            "zip_name": metadata.zip_name,
            "version": metadata.version,
            "python_version": metadata.python_version,
            "lang": metadata.lang,
            "is_nsfw": metadata.is_nsfw,
        }

        meta_path.parent.mkdir(parents=True, exist_ok=True)
        with open(meta_path, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2)

    def extract_zip(self, pkg_name: str) -> None:
        """Extract downloaded zip file"""
        zip_path = self.get_download_path(pkg_name)
        extract_path = self.get_extension_path(pkg_name)

        if extract_path.exists():
            shutil.rmtree(extract_path)

        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(extract_path)

        logger.info(f"Extracted {pkg_name} to {extract_path}")

    def delete_extension(self, pkg_name: str) -> None:
        """Delete extension files"""
        ext_path = self.get_extension_path(pkg_name)
        if ext_path.exists():
            shutil.rmtree(ext_path)
            logger.info(f"Deleted extension {pkg_name}")

    def extension_exists(self, pkg_name: str) -> bool:
        """Check if extension directory exists"""
        return self.get_extension_path(pkg_name).exists()

    def list_extension_dirs(self) -> list[str]:
        """List all extension directories"""
        if not self.extensions_dir.exists():
            return []
        return [d.name for d in self.extensions_dir.iterdir() if d.is_dir()]
