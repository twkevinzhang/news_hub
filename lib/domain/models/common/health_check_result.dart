enum ServingStatus { unknown, serving, notServing, serviceUnknown }

class HealthCheckResult {
  final ServingStatus status;
  final String? message;

  HealthCheckResult({required this.status, this.message});
}
