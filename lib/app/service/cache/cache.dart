import 'package:cached_query/cached_query.dart';
import 'package:injectable/injectable.dart';

@singleton
class CacheService {
  CacheService() {
    CachedQuery.instance.config(
      config: QueryConfig(
        refetchDuration: Duration(minutes: 5),
        cacheDuration: Duration(hours: 24),
      ),
    );
  }
}
