"""Unit tests for Extension Entity"""
import unittest
from pathlib import Path
from domain.entities.extension import Extension
from domain.value_objects.extension_metadata import ExtensionMetadata


class TestExtensionEntity(unittest.TestCase):
    """Test Extension Entity"""

    def setUp(self):
        """Set up test fixtures"""
        self.metadata = ExtensionMetadata(
            pkg_name="test_extension",
            display_name="Test Extension",
            version=1,
            python_version=3,
            lang="en",
            is_nsfw=False,
            icon_url=None
        )
        self.installation_path = Path("/tmp/extensions/test_extension")

    def test_create_extension(self):
        """Test creating an extension"""
        extension = Extension(
            metadata=self.metadata,
            installation_path=self.installation_path,
            is_installed=False
        )

        self.assertEqual(extension.pkg_name, "test_extension")
        self.assertEqual(extension.display_name, "Test Extension")
        self.assertEqual(extension.version, 1)
        self.assertFalse(extension.is_installed)

    def test_mark_as_installed(self):
        """Test marking extension as installed"""
        extension = Extension(
            metadata=self.metadata,
            installation_path=self.installation_path,
            is_installed=False
        )

        extension.mark_as_installed()
        self.assertTrue(extension.is_installed)

    def test_mark_as_uninstalled(self):
        """Test marking extension as uninstalled"""
        extension = Extension(
            metadata=self.metadata,
            installation_path=self.installation_path,
            is_installed=True
        )

        extension.mark_as_uninstalled()
        self.assertFalse(extension.is_installed)

    def test_get_resolver_path(self):
        """Test getting resolver path"""
        extension = Extension(
            metadata=self.metadata,
            installation_path=self.installation_path,
            is_installed=True
        )

        expected_path = Path("/tmp/extensions/test_extension/resolver_impl.py")
        self.assertEqual(extension.get_resolver_path(), expected_path)


class TestExtensionMetadata(unittest.TestCase):
    """Test Extension Metadata Value Object"""

    def test_create_valid_metadata(self):
        """Test creating valid metadata"""
        metadata = ExtensionMetadata(
            pkg_name="test_extension",
            display_name="Test Extension",
            version=1,
            python_version=3,
        )

        self.assertEqual(metadata.pkg_name, "test_extension")
        self.assertEqual(metadata.display_name, "Test Extension")

    def test_empty_pkg_name_raises_error(self):
        """Test that empty pkg_name raises ValueError"""
        with self.assertRaises(ValueError):
            ExtensionMetadata(
                pkg_name="",
                display_name="Test",
                version=1,
                python_version=3,
            )

    def test_negative_version_raises_error(self):
        """Test that negative version raises ValueError"""
        with self.assertRaises(ValueError):
            ExtensionMetadata(
                pkg_name="test",
                display_name="Test",
                version=-1,
                python_version=3,
            )

    def test_metadata_is_immutable(self):
        """Test that metadata is immutable"""
        metadata = ExtensionMetadata(
            pkg_name="test",
            display_name="Test",
            version=1,
            python_version=3,
        )

        with self.assertRaises(AttributeError):
            metadata.pkg_name = "new_name"


if __name__ == '__main__':
    unittest.main()
