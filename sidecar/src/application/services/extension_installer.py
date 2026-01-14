"""Extension Installer Service"""
import logging
import subprocess
import sys
from pathlib import Path

from infrastructure.downloaders.http_downloader import HttpDownloader
from infrastructure.file_system.extension_file_manager import ExtensionFileManager


from infrastructure.progress_tracker import ProgressTracker


logger = logging.getLogger(__name__)


class ExtensionInstaller:
    """Handles extension installation process"""

    def __init__(self, downloader: HttpDownloader, file_manager: ExtensionFileManager, progress_tracker: ProgressTracker):
        self.downloader = downloader
        self.file_manager = file_manager
        self.progress_tracker = progress_tracker

    def download(self, url: str, pkg_name: str) -> None:
        """Download extension zip file"""
        destination = self.file_manager.get_download_path(pkg_name)
        self.downloader.download_file_sync(url, destination)

    def download_directory(self, repo_url: str, pkg_name: str) -> None:
        """Download a directory from GitHub repository"""
        if not repo_url:
            raise ValueError(f"Repository URL cannot be None for extension {pkg_name}")

        self.progress_tracker.set_progress(pkg_name, 10)
        zip_path = self._download_repo_zip(repo_url)

        if not zip_path:
            raise ValueError(f"Failed to download repository zip for {repo_url}")

        self.progress_tracker.set_progress(pkg_name, 40)
        self.file_manager.extract_directory_from_zip(zip_path, pkg_name, pkg_name)

        if zip_path.exists():
            zip_path.unlink()
        self.progress_tracker.set_progress(pkg_name, 60)

    def _download_repo_zip(self, repo_url: str) -> Path | None:
        """Try to download repository zip from main or master branch"""
        for branch in ["main", "master"]:
            try:
                zip_url = f"{repo_url.rstrip('/')}/archive/refs/heads/{branch}.zip"
                destination = self.file_manager.download_github_zip(repo_url, branch)
                self.downloader.download_file_sync(zip_url, destination)
                return destination
            except Exception as e:
                logger.debug(f"Failed to download zip from {branch}: {e}")
                continue
        return None

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
        self.progress_tracker.set_progress(pkg_name, 70)
        try:
            subprocess.check_call(
                [sys.executable, '-m', 'pip', 'install', '-r', str(req_path)],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.PIPE
            )
            logger.info(f"Requirements installed for {pkg_name}")
            self.progress_tracker.set_progress(pkg_name, 90)
        except subprocess.CalledProcessError as e:
            logger.error(f"Failed to install requirements for {pkg_name}: {e}")
            raise
