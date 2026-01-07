"""Main entry point for Sidecar service"""
import logging
import asyncio
import grpc
from shared.config import Config
from shared.dependency_container import DependencyContainer
import sidecar_api_pb2_grpc as pb2_grpc

class LoggingInterceptor(grpc.aio.ServerInterceptor):
    """Interceptor to log all gRPC requests"""
    async def intercept_service(self, continuation, handler_call_details):
        logger = logging.getLogger(__name__)
        logger.debug(f"gRPC call received: {handler_call_details.method}")
        return await continuation(handler_call_details)

async def main():
    """Start the gRPC server"""
    # Note: Logging is initialized inside DependencyContainer via LoggingService
    logger = logging.getLogger(__name__)

    try:
        # Initialize dependencies
        container = DependencyContainer()
        
        # Set event loop for logging stream handler
        container.logging_service.stream_handler.set_loop(asyncio.get_running_loop())

        # Create gRPC server - aio server doesn't use ThreadPoolExecutor for logic
        server = grpc.aio.server(
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
        await server.start()

        logger.info(f"gRPC aio server running on port {Config.GRPC_PORT}...")
        
        # # ==========
        # # Start test log generator
        # async def generate_test_logs():
        #     """Generate a test log every second for debugging"""
        #     counter = 0
        #     test_logger = logging.getLogger("sidecar.test")
        #     while True:
        #         counter += 1
        #         test_logger.info(f"Test log message #{counter} - Verifying log streaming pipeline")
        #         await asyncio.sleep(1)
        
        # asyncio.create_task(generate_test_logs())
        # logger.info("Test log generator started (1 log/second)")
        # # ==========
        
        await server.wait_for_termination()

    except Exception as e:
        logger.exception(f"Server error: {e}")
        raise


if __name__ == "__main__" or __name__ == "main":
    try:
        asyncio.run(main())
    except Exception as e:
        # Fallback logging if logger isn't initialized
        print(f"Fatal startup error: {e}")
        raise
