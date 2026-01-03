"""Health check service for monitoring sidecar status"""
import logging
from enum import Enum
from typing import Optional
import sidecar_api_pb2 as pb2


class HealthStatus(Enum):
    """Health status enumeration"""
    UNKNOWN = pb2.HealthCheckRes.UNKNOWN
    SERVING = pb2.HealthCheckRes.SERVING
    NOT_SERVING = pb2.HealthCheckRes.NOT_SERVING
    SERVICE_UNKNOWN = pb2.HealthCheckRes.SERVICE_UNKNOWN


class HealthCheckService:
    """Service for health checking"""
    
    def __init__(self):
        self._status = HealthStatus.SERVING
        self._message: Optional[str] = None
        self.logger = logging.getLogger(__name__)
    
    def set_status(self, status: HealthStatus, message: Optional[str] = None):
        """Set health status"""
        self._status = status
        self._message = message
        self.logger.info(f"Health status changed to {status.name}: {message or 'N/A'}")
    
    def get_status(self) -> tuple[HealthStatus, Optional[str]]:
        """Get current health status"""
        return self._status, self._message
    
    def check(self, service_name: Optional[str] = None) -> pb2.HealthCheckRes:
        """Perform health check"""
        if service_name and service_name != "":
            # Check specific service
            # For now, we only have one service, so return SERVICE_UNKNOWN for others
            return pb2.HealthCheckRes(
                status=pb2.HealthCheckRes.SERVICE_UNKNOWN,
                message=f"Service '{service_name}' not found"
            )
        
        # Check overall health
        status, message = self.get_status()
        return pb2.HealthCheckRes(
            status=status.value,
            message=message or ""
        )
