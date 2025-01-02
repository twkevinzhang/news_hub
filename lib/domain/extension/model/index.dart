sealed class Extension {
  final String name;
  final String zipName;
  final String address;
  final String versionName;
  final int versionCode;
  final double libVersion;
  final String? lang;
  final bool isNsfw;

  Extension({
    required this.name,
    required this.zipName,
    required this.address,
    required this.versionName,
    required this.versionCode,
    required this.libVersion,
    this.lang,
    required this.isNsfw,
  });
}

class InstalledExtension extends Extension {
  final String? pkgFactory;
  final bool hasUpdate;
  final bool isObsolete;
  final String? repoUrl;

  InstalledExtension({
    required super.name,
    required super.zipName,
    required super.address,
    required super.versionName,
    required super.versionCode,
    required super.libVersion,
    required super.lang,
    required super.isNsfw,
    this.pkgFactory,
    this.hasUpdate = false,
    this.isObsolete = false,
    this.repoUrl,
  });
}

class AvailableExtension extends Extension {
  final String iconUrl;
  final String repoUrl;

  AvailableExtension({
    required super.name,
    required super.zipName,
    required super.address,
    required super.versionName,
    required super.versionCode,
    required super.libVersion,
    required super.lang,
    required super.isNsfw,
    required this.iconUrl,
    required this.repoUrl,
  });
}

class Source {
  final int id;
  final String lang;
  final String name;
  final String baseUrl;

  Source({
    required this.id,
    required this.lang,
    required this.name,
    required this.baseUrl,
  });

// Assuming StubSource is defined elsewhere
// StubSource toStubSource() {
//   return StubSource(
//     id: this.id,
//     lang: this.lang,
//     name: this.name,
//   );
// }
}

class UntrustedExtension extends Extension {
  final String signatureHash;

  UntrustedExtension({
    required super.name,
    required super.zipName,
    required super.address,
    required super.versionName,
    required super.versionCode,
    required super.libVersion,
    required this.signatureHash,
    super.lang,
    super.isNsfw = false,
  });
}

enum InstallStep {
  idle,
  pending,
  downloading,
  installing,
  installed,
  error,
}

extension InstallStepExtension on InstallStep {
  bool isCompleted() {
    return this == InstallStep.installed || this == InstallStep.error || this == InstallStep.idle;
  }
}
