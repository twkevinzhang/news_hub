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

    def __init__(self, extensions_dir: Path, download_dir: Path, persistent_dir: Path):
        self.extensions_dir = extensions_dir
        self.download_dir = download_dir
        self.persistent_dir = persistent_dir
        self.installed_file = persistent_dir / "installed_extensions.json"

    def get_extension_path(self, pkg_name: str) -> Path:
        """Get extension installation path"""
        return self.extensions_dir / pkg_name

    def get_download_path(self, pkg_name: str) -> Path:
        """Get download path for extension zip"""
        return self.download_dir / f"{pkg_name}.zip"

    def load_installed_extensions(self) -> list[ExtensionMetadata]:
        """Load all installed extensions metadata from centralized JSON"""
        if not self.installed_file.exists():
            return []

        try:
            with open(self.installed_file, "r", encoding="utf-8") as f:
                data = json.load(f)
                return [
                    ExtensionMetadata(
                        repo_base_url=item.get("repo_base_url", ""),
                        pkg_name=item["pkg_name"],
                        display_name=item.get("display_name", item["pkg_name"]),
                        zip_name=item.get("zip_name", ""),
                        version=item.get("version", 0),
                        python_version=item.get("python_version", 3),
                        lang=item.get("lang"),
                        is_nsfw=item.get("is_nsfw", False),
                        icon_url=item.get("icon_url"),
                        repo_url=item.get("repo_url"),
                    )
                    for item in data
                ]
        except (json.JSONDecodeError, KeyError, IOError) as e:
            logger.error(f"Failed to load installed_extensions.json: {e}")
            return []

    def save_installed_extensions(self, extensions: list[ExtensionMetadata]) -> None:
        """Save all installed extensions metadata to centralized JSON"""
        data = [
            {
                "repo_base_url": m.repo_base_url,
                "pkg_name": m.pkg_name,
                "display_name": m.display_name,
                "zip_name": m.zip_name,
                "version": m.version,
                "python_version": m.python_version,
                "lang": m.lang,
                "is_nsfw": m.is_nsfw,
                "icon_url": m.icon_url,
                "repo_url": m.repo_url,
            }
            for m in extensions
        ]

        self.persistent_dir.mkdir(parents=True, exist_ok=True)
        with open(self.installed_file, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)

    def download_github_zip(self, repo_url: str, branch: str = "main") -> Path:
        """
        Download GitHub repository as ZIP (internal helper)
        Returns path to the downloaded zip
        """
        # Convert GitHub URL to zip download URL
        # e.g., https://github.com/user/repo -> https://github.com/user/repo/archive/refs/heads/main.zip
        base_url = repo_url.rstrip("/")
        if base_url.endswith(".git"):
            base_url = base_url[:-4]
        
        zip_url = f"{base_url}/archive/refs/heads/{branch}.zip"
        # We'll use a temporary name for the repo zip
        repo_name = base_url.split("/")[-1]
        destination = self.download_dir / f"{repo_name}_{branch}.zip"
        
        # This will be handled by the installer calling HttpDownloader
        return destination

    def extract_directory_from_zip(self, zip_path: Path, dir_name: str, pkg_name: str) -> None:
        """
        Extract a specific directory from a repository zip and move it to extensions dir
        """
        extract_tmp = self.download_dir / f"tmp_{pkg_name}"
        if extract_tmp.exists():
            shutil.rmtree(extract_tmp)
        
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            # GitHub zips have a root folder like "repo-main/"
            root_name = zip_ref.namelist()[0].split('/')[0]
            target_prefix = f"{root_name}/{dir_name}/"
            
            members = [m for m in zip_ref.namelist() if m.startswith(target_prefix)]
            if not members:
                # Try master if main failed, but here we assume zip_path is already correct
                raise ValueError(f"Directory {dir_name} not found in zip")
            
            for member in members:
                zip_ref.extract(member, extract_tmp)
        
        # Move the content of {extract_tmp}/{root_name}/{dir_name} to extensions/{pkg_name}
        source_dir = extract_tmp / root_name / dir_name
        dest_dir = self.get_extension_path(pkg_name)
        
        if dest_dir.exists():
            shutil.rmtree(dest_dir)
        
        shutil.move(str(source_dir), str(dest_dir))
        shutil.rmtree(extract_tmp)
        
        logger.info(f"Extracted directory {dir_name} to {dest_dir}")

    def load_metadata(self, pkg_name: str) -> Optional[ExtensionMetadata]:
        # Keep this for backward compatibility or individual lookups, 
        # but the centralized JSON is now preferred.
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
                    icon_url=data.get("icon_url"),
                    repo_url=data.get("repo_url"),
                )
        except (json.JSONDecodeError, KeyError) as e:
            logger.error(f"Failed to load metadata for {pkg_name}: {e}")
            return None

    def save_metadata(self, metadata: ExtensionMetadata) -> None:
        # Save to both individual metadata.json and centralized list
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
            "icon_url": metadata.icon_url,
            "repo_url": metadata.repo_url,
        }

        meta_path.parent.mkdir(parents=True, exist_ok=True)
        with open(meta_path, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
            
        # Update centralized JSON
        installed = self.load_installed_extensions()
        # Update if exists, else append
        updated = False
        for i, m in enumerate(installed):
            if m.pkg_name == metadata.pkg_name:
                installed[i] = metadata
                updated = True
                break
        if not updated:
            installed.append(metadata)
        self.save_installed_extensions(installed)

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
        """Delete extension files and metadata"""
        # Delete files
        ext_path = self.get_extension_path(pkg_name)
        if ext_path.exists():
            shutil.rmtree(ext_path)
            logger.info(f"Deleted extension files {pkg_name}")
            
        # Update centralized JSON
        installed = self.load_installed_extensions()
        installed = [m for m in installed if m.pkg_name != pkg_name]
        self.save_installed_extensions(installed)

    def extension_exists(self, pkg_name: str) -> bool:
        """Check if extension is recorded as installed"""
        installed = self.load_installed_extensions()
        return any(m.pkg_name == pkg_name for m in installed)

    def list_extension_dirs(self) -> list[str]:
        """List all extension package names from centralized JSON"""
        installed = self.load_installed_extensions()
        return [m.pkg_name for m in installed]
