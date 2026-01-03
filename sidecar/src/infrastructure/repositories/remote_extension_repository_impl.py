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

    def fetch_all(self, repo_base_url: str) -> List[ExtensionMetadata]:
        """Fetch all available extensions from remote repository"""
        index_url = f"{repo_base_url}/index.json"
        data = self.downloader.fetch_json_sync(index_url)

        if not data or "extensions" not in data:
            logger.warning(f"No extensions found at {index_url}")
            return []

        extensions = []
        for item in data["extensions"]:
            try:
                metadata = ExtensionMetadata(
                    repo_base_url=repo_base_url,
                    pkg_name=item["pkg_name"],
                    display_name=item["display_name"],
                    zip_name=item["zip_name"],
                    version=item["version"],
                    python_version=item.get("python_version", 3),
                    lang=item.get("lang"),
                    is_nsfw=item.get("is_nsfw", False),
                    icon_url=item.get("icon_url"),
                    repo_url=item.get("repo_url"),
                )
                extensions.append(metadata)
            except (KeyError, ValueError) as e:
                logger.error(f"Failed to parse extension metadata: {e}")
                continue

        return extensions
