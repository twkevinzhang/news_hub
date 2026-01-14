class Extension {
  final String pkgName;
  final String displayName;
  final int version;
  final int pythonVersion;
  final String? lang;
  final bool isNsfw;

  Extension({
    required this.pkgName,
    required this.displayName,
    required this.version,
    required this.pythonVersion,
    this.lang,
    required this.isNsfw,
  });
}
