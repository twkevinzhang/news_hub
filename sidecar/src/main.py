"""Main entry point for Sidecar service"""
import logging
from concurrent import futures
import grpc
import threading
import time

class LoggingInterceptor(grpc.ServerInterceptor):
    """Interceptor to log all gRPC requests"""
    def intercept_service(self, continuation, handler_call_details):
        logger = logging.getLogger(__name__)
        logger.debug(f"gRPC call received: {handler_call_details.method}")
        handler = continuation(handler_call_details)
        return handler

def main():
    """Start the gRPC server"""
    from shared.config import Config
    from shared.dependency_container import DependencyContainer
    import sidecar_api_pb2_grpc as pb2_grpc

    # Note: Logging is initialized inside DependencyContainer via LoggingService
    logger = logging.getLogger(__name__)

    try:
        # Initialize dependencies
        container = DependencyContainer()

        # Create gRPC server with logging interceptor
        server = grpc.server(
            futures.ThreadPoolExecutor(max_workers=Config.MAX_WORKERS),
            interceptors=[LoggingInterceptor()],
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
        
        # ==========
        # Start test log generator thread
        def generate_test_logs():
            """Generate a test log every second for debugging"""
            counter = 0
            test_logger = logging.getLogger("sidecar.test")
            while True:
                counter += 1
                test_logger.info(f"Test log message #{counter} - Verifying log streaming pipeline")
                time.sleep(1)
        
        log_thread = threading.Thread(target=generate_test_logs, daemon=True)
        log_thread.start()
        logger.info("Test log generator started (1 log/second)")
        # ==========
        
        server.wait_for_termination()

    except Exception as e:
        logger.exception(f"Server error: {e}")
        raise


if __name__ == "__main__" or __name__ == "main":
    try:
        main()
    except Exception as e:
        # Fallback logging if logger isn't initialized
        print(f"Fatal startup error: {e}")
        raise
