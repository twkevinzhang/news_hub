"""Test namespace isolation and double adaptation pattern"""
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
    """Verify that multiple namespaces and filenames can coexist and be converted"""

    def test_multiple_extensions_coexistence(self):
        """
        Verify that loading multiple extensions with unique filenames
        doesn't conflict and adaptive pattern works for both.
        """
        extensions_root = Path("/Users/zhangzhenlong/Projects/news_hub_extensions")
        
        # 1. Load Komica
        komica_path = extensions_root / "twkevinzhang_komica"
        sys.path.insert(0, str(komica_path))
        komica_resolver = importlib.import_module("twkevinzhang_komica.resolver_impl")
        
        # 2. Load Mock
        mock_path = extensions_root / "twkevinzhang_mock"
        sys.path.insert(0, str(mock_path))
        mock_resolver = importlib.import_module("twkevinzhang_mock.resolver_impl")
        
        try:
            # Verify descriptors are independent
            self.assertIn("komica_api.proto", komica_resolver.pb2.DESCRIPTOR.name)
            self.assertIn("mock_api.proto", mock_resolver.pb2.DESCRIPTOR.name)
            
            self.assertNotEqual(komica_resolver.pb2.DESCRIPTOR, mock_resolver.pb2.DESCRIPTOR)
            
            # Test adaptation for both
            sidecar_req = pb2.GetBoardsReq(pkg_name="any")
            
            # Komica adaptation
            ext_req_k = komica_resolver.pb2.GetBoardsReq()
            ext_req_k.ParseFromString(sidecar_req.SerializeToString())
            self.assertEqual(ext_req_k.pkg_name, "any")
            
            # Mock adaptation
            ext_req_m = mock_resolver.pb2.GetBoardsReq()
            ext_req_m.ParseFromString(sidecar_req.SerializeToString())
            self.assertEqual(ext_req_m.pkg_name, "any")
            
            print("\n[SUCCESS] Multiple extensions coexistence verified!")
            
        finally:
            if str(komica_path) in sys.path: sys.path.remove(str(komica_path))
            if str(mock_path) in sys.path: sys.path.remove(str(mock_path))

if __name__ == "__main__":
    unittest.main()
