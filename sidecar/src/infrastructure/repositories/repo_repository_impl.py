"""Repo Repository Implementation"""
import json
import logging
from datetime import datetime
from pathlib import Path
from typing import List, Optional

from domain.entities.repo import Repo
from domain.repositories.repo_repository import RepoRepository


logger = logging.getLogger(__name__)


class RepoRepositoryImpl(RepoRepository):
    """File-based implementation of Repo Repository"""

    REPOS_FILE = "repos.json"

    def __init__(self, persistent_dir: Path):
        self.persistent_dir = persistent_dir
        self.repos_file = persistent_dir / self.REPOS_FILE

    def add(self, repo: Repo) -> None:
        """Add a new repository"""
        repos = self._load_repos()

        for existing_repo in repos:
            if existing_repo["url"].lower() == repo.url.lower():
                logger.warning(f"Repository {repo.url} already exists")
                return

        repos.append({
            "url": repo.url,
            "added_at": repo.added_at.isoformat(),
            "display_name": repo.display_name,
            "website": repo.website,
            "signing_key_fingerprint": repo.signing_key_fingerprint,
            "icon": repo.icon
        })
        self._save_repos(repos)
        logger.info(f"Added repository: {repo.url}")

    def remove(self, url: str) -> None:
        """Remove a repository by URL"""
        repos = self._load_repos()
        original_count = len(repos)

        repos = [
            repo for repo in repos
            if repo["url"].lower() != url.lower()
        ]

        if len(repos) < original_count:
            self._save_repos(repos)
            logger.info(f"Removed repository: {url}")
        else:
            logger.warning(f"Repository not found: {url}")

    def find_by_url(self, url: str) -> Optional[Repo]:
        """Find repository by URL"""
        repos = self._load_repos()
        for repo_data in repos:
            if repo_data["url"].lower() == url.lower():
                return self._dict_to_repo(repo_data)
        return None

    def find_all(self) -> List[Repo]:
        """Find all registered repositories"""
        repos = self._load_repos()
        return [self._dict_to_repo(repo_data) for repo_data in repos]

    def exists(self, url: str) -> bool:
        """Check if repository exists"""
        return self.find_by_url(url) is not None

    def _load_repos(self) -> List[dict]:
        """Load repositories from file"""
        if not self.repos_file.exists():
            return []

        try:
            with open(self.repos_file, "r", encoding="utf-8") as f:
                data = json.load(f)
                return data if isinstance(data, list) else []
        except (json.JSONDecodeError, IOError) as e:
            logger.error(f"Error loading repos from {self.repos_file}: {e}")
            return []

    def _save_repos(self, repos: List[dict]) -> None:
        """Save repositories to file"""
        try:
            self.persistent_dir.mkdir(parents=True, exist_ok=True)
            with open(self.repos_file, "w", encoding="utf-8") as f:
                json.dump(repos, f, indent=2, ensure_ascii=False)
        except IOError as e:
            logger.error(f"Error saving repos to {self.repos_file}: {e}")
            raise

    def _dict_to_repo(self, repo_dict: dict) -> Repo:
        """Convert dictionary to Repo entity"""
        return Repo(
            url=repo_dict["url"],
            added_at=datetime.fromisoformat(repo_dict["added_at"]),
            display_name=repo_dict.get("display_name", ""),
            website=repo_dict.get("website", ""),
            signing_key_fingerprint=repo_dict.get("signing_key_fingerprint", ""),
            icon=repo_dict.get("icon")
        )
