"""Unit tests for Use Cases"""
import unittest
from unittest.mock import Mock, MagicMock
from pathlib import Path

from domain.entities.extension import Extension
from domain.value_objects.extension_metadata import ExtensionMetadata
from application.use_cases.install_extension import InstallExtensionUseCase
from application.use_cases.uninstall_extension import UninstallExtensionUseCase
from application.use_cases.list_installed_extensions import ListInstalledExtensionsUseCase


class TestInstallExtensionUseCase(unittest.TestCase):
    """Test Install Extension Use Case"""

    def setUp(self):
        """Set up test fixtures"""
        self.repository = Mock()
        self.installer = Mock()
        self.installer.file_manager = Mock()

        self.use_case = InstallExtensionUseCase(
            repository=self.repository,
            installer=self.installer
        )

        self.metadata = ExtensionMetadata(
            pkg_name="test_ext",
            display_name="Test Extension",
            version=1,
            python_version=3,
        )

    def test_install_new_extension(self):
        """Test installing a new extension"""
        # Setup mocks
        self.repository.exists.return_value = False
        self.installer.file_manager.get_extension_path.return_value = Path("/tmp/test_ext")

        # Execute
        result = self.use_case.execute(self.metadata)

        # Verify
        self.repository.exists.assert_called_once_with("test_ext")
        self.installer.download_directory.assert_called_once()
        self.installer.install_requirements.assert_called_once_with("test_ext")
        self.repository.save.assert_called_once()

        self.assertEqual(result.pkg_name, "test_ext")
        self.assertTrue(result.is_installed)

    def test_install_existing_extension(self):
        """Test installing an already installed extension"""
        # Setup mocks
        existing_extension = Extension(
            metadata=self.metadata,
            installation_path=Path("/tmp/test_ext"),
            is_installed=True
        )
        self.repository.exists.return_value = True
        self.repository.find_by_pkg_name.return_value = existing_extension

        # Execute
        result = self.use_case.execute(self.metadata)

        # Verify - should not download/install again
        self.installer.download.assert_not_called()
        self.assertEqual(result, existing_extension)


class TestUninstallExtensionUseCase(unittest.TestCase):
    """Test Uninstall Extension Use Case"""

    def setUp(self):
        """Set up test fixtures"""
        self.repository = Mock()
        self.loader = Mock()

        self.use_case = UninstallExtensionUseCase(
            repository=self.repository,
            loader=self.loader
        )

    def test_uninstall_existing_extension(self):
        """Test uninstalling an existing extension"""
        # Setup mocks
        self.repository.exists.return_value = True

        # Execute
        self.use_case.execute("test_ext")

        # Verify
        self.repository.exists.assert_called_once_with("test_ext")
        self.loader.unload_resolver.assert_called_once_with("test_ext")
        self.repository.delete.assert_called_once_with("test_ext")

    def test_uninstall_nonexistent_extension(self):
        """Test uninstalling a non-existent extension"""
        # Setup mocks
        self.repository.exists.return_value = False

        # Execute
        self.use_case.execute("test_ext")

        # Verify - should not try to delete
        self.repository.delete.assert_not_called()


class TestListInstalledExtensionsUseCase(unittest.TestCase):
    """Test List Installed Extensions Use Case"""

    def setUp(self):
        """Set up test fixtures"""
        self.repository = Mock()
        self.use_case = ListInstalledExtensionsUseCase(repository=self.repository)

    def test_list_extensions(self):
        """Test listing installed extensions"""
        # Setup mocks
        ext1 = Mock()
        ext2 = Mock()
        self.repository.find_all.return_value = [ext1, ext2]

        # Execute
        result = self.use_case.execute()

        # Verify
        self.repository.find_all.assert_called_once()
        self.assertEqual(len(result), 2)
        self.assertEqual(result, [ext1, ext2])


if __name__ == '__main__':
    unittest.main()
