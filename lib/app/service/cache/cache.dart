import 'package:cached_query/cached_query.dart';
import 'package:injectable/injectable.dart';

@singleton
class CacheService {
  CacheService() {
    CachedQuery.instance.config(
      config: QueryConfig(
        refetchDuration: const Duration(minutes: 5),
        cacheDuration: const Duration(hours: 24),
      ),
    );
  }
}
