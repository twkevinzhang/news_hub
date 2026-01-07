"""Test namespace isolation and adapter pattern"""
import unittest
import sys
import os
from pathlib import Path
import importlib

# Add src to sys.path
src_path = str(Path(__file__).parent.parent.parent)
if src_path not in sys.path:
    sys.path.insert(0, src_path)

import domain_models_pb2 as domain_pb2
import sidecar_api_pb2 as pb2

class TestNamespaceIsolation(unittest.TestCase):
    """Verify that multiple namespaces can coexist and be converted"""

    def test_sidecar_and_extension_coexistence(self):
        """
        Verify that loading an extension with 'package pb' 
        doesn't conflict with sidecar's new namespaced protos.
        """
        # 1. Sidecar protos are already loaded (imported above)
        self.assertEqual(domain_pb2.DESCRIPTOR.package, "news_hub.domain")
        
        # 2. Simulate loading an extension that uses 'package pb'
        # We'll use twkevinzhang_komica from the other workspace
        extensions_root = Path("/Users/zhangzhenlong/Projects/news_hub_extensions")
        ext_pkg_path = extensions_root / "twkevinzhang_komica"
        
        if not ext_pkg_path.exists():
            self.skipTest(f"Extension path not found: {ext_pkg_path}")
            
        sys.path.insert(0, str(ext_pkg_path))
        
        try:
            # This is the moment of truth: will it throw Duplicate Symbol error?
            komica_module = importlib.import_module("twkevinzhang_komica.resolver_impl")
            importlib.reload(komica_module) # Ensure it reloads in this process
            
            # If we reach here, isolation worked!
            self.assertTrue(True, "Successfully loaded extension without symbol collision")
            
            # 3. Test Adapter Logic (Manual Simulation)
            # Create a response using extension's 'pb' namespace
            ext_pb2 = komica_module.pb2
            ext_res = ext_pb2.GetSiteRes(
                site=ext_pb2.Site(
                    name="Test Site",
                    url="https://test.com"
                )
            )
            
            # Convert to sidecar's namespace using serialization
            serialized = ext_res.SerializeToString()
            sidecar_res = pb2.GetSiteRes()
            sidecar_res.ParseFromString(serialized)
            
            self.assertEqual(sidecar_res.site.name, "Test Site")
            self.assertEqual(sidecar_res.site.url, "https://test.com")
            self.assertNotEqual(ext_res.__class__, sidecar_res.__class__)
            
            print("\n[SUCCESS] Namespace isolation verified!")
            print(f"Extension Class: {ext_res.__class__}")
            print(f"Sidecar Class:   {sidecar_res.__class__}")
            
        except Exception as e:
            self.fail(f"Failed during isolation test: {e}")
        finally:
            if str(ext_pkg_path) in sys.path:
                sys.path.remove(str(ext_pkg_path))

if __name__ == "__main__":
    unittest.main()
