import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_check_result.freezed.dart';

enum ServingStatus { unknown, serving, notServing, serviceUnknown }

@freezed
class HealthCheckResult with _$HealthCheckResult {
  const factory HealthCheckResult({
    required ServingStatus status,
    String? message,
  }) = _HealthCheckResult;
}
