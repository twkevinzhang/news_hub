import 'package:news_hub/app/service/database/database.dart' as database;
import 'package:news_hub/domain/models/models.dart' as domain;

extension ExtensionTransform on database.InstalledExtension {
  domain.Extension toDomain() {
    return domain.Extension(
      repoBaseUrl: repoBaseUrl,
      pkgName: pkgName,
      displayName: displayName,
      zipName: zipName, // Assuming zipName is not stored in the database
      version: version,
      pythonVersion:
          pythonVersion, // Assuming pythonVersion is not stored in the database
      lang: lang, // Assuming lang is not stored in the database
      isNsfw: isNsfw, // Assum
    );
  }
}
