import logging
from concurrent import futures
import grpc

from logger import initLogger

# configure
port = 55001

initLogger()

# When called by serious_python, __name__ is "main"
if __name__ == "__main__" or __name__ == "main":
    try:
        from api_server_impl import ApiServerImpl
        import sidecar_api_pb2_grpc as pb2_grpc

        logging.debug(f'grpc modules imported')

        server = grpc.server(
            futures.ThreadPoolExecutor(max_workers=1),
            options=[
                ('grpc.logging_verbosity', 'DEBUG'),
            ]
        )
        pb2_grpc.add_ExtensionApiServicer_to_server(ApiServerImpl(), server)
        server.add_insecure_port(f'[::]:{port}')
        server.start()
        logging.info("gRPC server running...")
        server.wait_for_termination()
    except Exception as e:
        logging.exception(e)
