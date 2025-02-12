import 'package:news_hub/app/service/database/database.dart' as database;
import 'package:news_hub/domain/models/models.dart' as domain;

extension ExtensionRepoTransform on database.ExtensionRepo {
  domain.ExtensionRepo toDomain() {
    return domain.ExtensionRepo(
      icon: icon,
      baseUrl: baseUrl,
      displayName: displayName,
      website: website,
      signingKeyFingerprint: signingKeyFingerprint,
    );
  }
}
