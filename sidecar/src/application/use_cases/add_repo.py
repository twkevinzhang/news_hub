"""Add Repo Use Case"""
import logging
from datetime import datetime

from domain.entities.repo import Repo
from domain.repositories.repo_repository import RepoRepository
from infrastructure.downloaders.http_downloader import HttpDownloader


logger = logging.getLogger(__name__)


class AddRepoUseCase:
    """Use case for adding a repository"""

    def __init__(
        self,
        repository: RepoRepository,
        downloader: HttpDownloader
    ):
        self.repository = repository
        self.downloader = downloader

    def execute(self, url: str) -> Repo:
        """
        Execute the add repo use case

        Args:
            url: GitHub repository URL

        Returns:
            Repo: The added repository entity

        Raises:
            ValueError: If URL is invalid or repository doesn't have extensions.json
        """
        logger.info(f"Adding repository: {url}")

        # Create repo entity for validation
        repo = Repo(url=url, added_at=datetime.now())

        # Validate GitHub URL
        if not repo.is_github_url():
            raise ValueError(f"Invalid GitHub URL: {url}")

        # Check if already added
        if self.repository.exists(url):
            logger.warning(f"Repository {url} already exists")
            existing = self.repository.find_by_url(url)
            if existing:
                return existing

        # Validate extensions.json exists in remote repository
        self._validate_extensions_json(url)

        # Save to repository
        self.repository.add(repo)
        logger.info(f"Successfully added repository: {url}")
        return repo

    def _validate_extensions_json(self, repo_url: str) -> None:
        """
        Validate that extensions.json exists in the repository root

        Args:
            repo_url: GitHub repository URL

        Raises:
            ValueError: If extensions.json doesn't exist or cannot be downloaded
        """
        # Remove trailing slash and .git suffix if present
        base_url = repo_url.rstrip("/")
        if base_url.endswith(".git"):
            base_url = base_url[:-4]

        # Construct raw GitHub URL for extensions.json
        # GitHub raw content URL: https://raw.githubusercontent.com/owner/repo/main/extensions.json
        parts = base_url.split("/")
        if len(parts) < 2:
            raise ValueError(f"Invalid GitHub URL format: {repo_url}")

        owner = parts[-2]
        repo_name = parts[-1]

        # Try common branch names
        for branch in ["main", "master"]:
            raw_url = f"https://raw.githubusercontent.com/{owner}/{repo_name}/{branch}/extensions.json"
            try:
                logger.debug(f"Checking for extensions.json at {raw_url}")
                response = self.downloader.download(raw_url)
                if response and len(response) > 0:
                    logger.debug(f"Found extensions.json in {repo_url}")
                    return
            except Exception as e:
                logger.debug(f"Failed to fetch from {branch}: {e}")
                continue

        raise ValueError(
            f"No extensions.json found in repository root "
            f"for {repo_url} (tried main and master branches)"
        )
