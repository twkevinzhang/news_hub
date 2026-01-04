import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository/sidecar_repository.dart';

@injectable
class WatchHealthUseCase {
  final SidecarRepository _repository;

  WatchHealthUseCase(this._repository);

  Stream<HealthCheckResult> call() {
    return _repository.watchHealth();
  }
}
