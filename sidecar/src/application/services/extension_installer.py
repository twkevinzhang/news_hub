"""Extension Installer Service"""
import logging
import subprocess
import sys
from pathlib import Path

from infrastructure.downloaders.http_downloader import HttpDownloader
from infrastructure.file_system.extension_file_manager import ExtensionFileManager


logger = logging.getLogger(__name__)


class ExtensionInstaller:
    """Handles extension installation process"""

    def __init__(self, downloader: HttpDownloader, file_manager: ExtensionFileManager):
        self.downloader = downloader
        self.file_manager = file_manager

    def download(self, url: str, pkg_name: str) -> None:
        """Download extension zip file"""
        destination = self.file_manager.get_download_path(pkg_name)
        self.downloader.download_file_sync(url, destination)

    def extract(self, pkg_name: str) -> None:
        """Extract extension zip file"""
        self.file_manager.extract_zip(pkg_name)

    def install_requirements(self, pkg_name: str) -> None:
        """Install extension requirements"""
        req_path = self.file_manager.get_extension_path(pkg_name) / "requirements.txt"

        if not req_path.exists():
            logger.info(f"No requirements.txt found for {pkg_name}")
            return

        logger.info(f"Installing requirements for {pkg_name}")
        try:
            subprocess.check_call(
                [sys.executable, '-m', 'pip', 'install', '-r', str(req_path)],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.PIPE
            )
            logger.info(f"Requirements installed for {pkg_name}")
        except subprocess.CalledProcessError as e:
            logger.error(f"Failed to install requirements for {pkg_name}: {e}")
            raise
