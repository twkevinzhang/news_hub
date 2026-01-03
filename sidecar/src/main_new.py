"""Main entry point for Sidecar service"""
import logging
from concurrent import futures
import grpc

from shared.config import Config
from shared.dependency_container import DependencyContainer
from logger import initLogger
import sidecar_api_pb2_grpc as pb2_grpc


def main():
    """Start the gRPC server"""
    # Initialize logger
    initLogger()
    logger = logging.getLogger(__name__)

    try:
        # Initialize dependencies
        container = DependencyContainer()

        # Create gRPC server
        server = grpc.server(
            futures.ThreadPoolExecutor(max_workers=Config.MAX_WORKERS),
            options=[
                ('grpc.logging_verbosity', 'DEBUG'),
            ]
        )

        # Add service to server
        pb2_grpc.add_SidecarApiServicer_to_server(
            container.sidecar_service,
            server
        )

        # Start server
        server.add_insecure_port(f'[::]:{Config.GRPC_PORT}')
        server.start()

        logger.info(f"gRPC server running on port {Config.GRPC_PORT}...")
        server.wait_for_termination()

    except Exception as e:
        logger.exception(f"Server error: {e}")
        raise


if __name__ == "__main__" or __name__ == "main":
    main()
