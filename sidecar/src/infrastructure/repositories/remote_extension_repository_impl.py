"""Remote Extension Repository Implementation"""
import logging
from typing import List

from domain.value_objects.extension_metadata import ExtensionMetadata
from domain.repositories.extension_repository import RemoteExtensionRepository
from infrastructure.downloaders.http_downloader import HttpDownloader


logger = logging.getLogger(__name__)


class RemoteExtensionRepositoryImpl(RemoteExtensionRepository):
    """HTTP-based implementation of Remote Extension Repository"""

    def __init__(self, downloader: HttpDownloader):
        self.downloader = downloader

    def fetch_all(self, repo_url: str) -> List[ExtensionMetadata]:
        """Fetch all available extensions from remote repository root"""
        base_url = repo_url.rstrip("/")
        if base_url.endswith(".git"):
            base_url = base_url[:-4]

        parts = base_url.split("/")
        if len(parts) < 2:
            logger.warning(f"Invalid GitHub URL: {repo_url}")
            return []

        owner = parts[-2]
        repo_name = parts[-1]

        data = None
        for branch in ["main", "master"]:
            raw_url = f"https://raw.githubusercontent.com/{owner}/{repo_name}/{branch}/extensions.json"
            logger.debug(f"Checking for extensions.json at {raw_url}")
            data = self.downloader.fetch_json_sync(raw_url)
            if data:
                break

        if not data or "extensions" not in data:
            logger.warning(f"No extensions found for {repo_url}")
            return []

        extensions = []
        for item in data["extensions"]:
            try:
                metadata = ExtensionMetadata(
                    pkg_name=item["pkg_name"],
                    display_name=item["display_name"],
                    version=item["version"],
                    python_version=item.get("python_version", 3),
                    lang=item.get("lang"),
                    is_nsfw=item.get("is_nsfw", False),
                    icon_url=item.get("icon_url"),
                )
                extensions.append(metadata)
            except (KeyError, ValueError) as e:
                logger.error(f"Failed to parse extension metadata: {e}")
                continue

        return extensions
