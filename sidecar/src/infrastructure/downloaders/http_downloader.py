"""HTTP downloader for extensions"""
import asyncio
import logging
from pathlib import Path
from typing import Optional
import aiohttp


logger = logging.getLogger(__name__)


class HttpDownloader:
    """Downloads files over HTTP"""

    def __init__(self, timeout: int = 30):
        self.timeout = aiohttp.ClientTimeout(total=timeout)

    async def download_file(self, url: str, destination: Path) -> None:
        """Download file from URL to destination"""
        # Remove existing file if it exists
        if destination.exists():
            destination.unlink()

        # Ensure parent directory exists
        destination.parent.mkdir(parents=True, exist_ok=True)

        logger.info(f"Downloading {url} to {destination}")

        async with aiohttp.ClientSession(timeout=self.timeout) as session:
            async with session.get(url) as response:
                response.raise_for_status()
                data = await response.read()

                with open(destination, "wb") as f:
                    f.write(data)

        logger.info(f"Download completed: {destination}")

    def download_file_sync(self, url: str, destination: Path) -> None:
        """Synchronous wrapper for download_file"""
        asyncio.run(self.download_file(url, destination))

    async def fetch_json(self, url: str) -> Optional[dict]:
        """Fetch JSON data from URL"""
        try:
            async with aiohttp.ClientSession(timeout=self.timeout) as session:
                async with session.get(url) as response:
                    response.raise_for_status()
                    return await response.json()
        except Exception as e:
            logger.error(f"Failed to fetch JSON from {url}: {e}")
            return None

    def fetch_json_sync(self, url: str) -> Optional[dict]:
        """Synchronous wrapper for fetch_json"""
        return asyncio.run(self.fetch_json(url))
