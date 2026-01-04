import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository/sidecar_repository.dart';

@injectable
class GetHealthStatusUseCase {
  final SidecarRepository _repository;

  GetHealthStatusUseCase(this._repository);

  Future<HealthCheckResult> call() {
    return _repository.getHealthStatus();
  }
}
