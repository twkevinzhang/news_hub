"""Repo Entity"""
from dataclasses import dataclass
from datetime import datetime
from urllib.parse import urlparse


@dataclass
class Repo:
    """Repo entity representing a registered repository"""

    url: str
    added_at: datetime
    display_name: str
    website: str
    signing_key_fingerprint: str
    icon: str = None

    def is_github_url(self) -> bool:
        """Check if the URL is a valid GitHub repository URL"""
        try:
            parsed = urlparse(self.url)
            return parsed.netloc.lower() == "github.com"
        except Exception:
            return False

    def get_repo_name(self) -> str:
        """Extract repository name from URL"""
        try:
            parsed = urlparse(self.url)
            path = parsed.path.rstrip("/").lower()
            if path.endswith(".git"):
                path = path[:-4]
            parts = path.split("/")
            if len(parts) >= 2:
                return parts[-1]
            return ""
        except Exception:
            return ""
