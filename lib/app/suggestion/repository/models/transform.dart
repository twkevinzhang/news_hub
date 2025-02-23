import 'package:news_hub/app/service/database/database.dart' as database;
import 'package:news_hub/domain/models/models.dart' as domain;

extension SuggestionTransform on database.Suggestion {
  domain.Suggestion toDomain() {
    return domain.Suggestion(
      id: id,
      keywords: keywords,
      latestUsedAt: latestUsedAt,
    );
  }
}
