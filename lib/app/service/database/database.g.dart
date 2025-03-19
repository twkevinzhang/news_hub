// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ExtensionReposTable extends ExtensionRepos
    with TableInfo<$ExtensionReposTable, ExtensionRepo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExtensionReposTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _baseUrlMeta =
      const VerificationMeta('baseUrl');
  @override
  late final GeneratedColumn<String> baseUrl = GeneratedColumn<String>(
      'base_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _websiteMeta =
      const VerificationMeta('website');
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
      'website', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _signingKeyFingerprintMeta =
      const VerificationMeta('signingKeyFingerprint');
  @override
  late final GeneratedColumn<String> signingKeyFingerprint =
      GeneratedColumn<String>('signing_key_fingerprint', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [icon, baseUrl, displayName, website, signingKeyFingerprint];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'extension_repos';
  @override
  VerificationContext validateIntegrity(Insertable<ExtensionRepo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    if (data.containsKey('base_url')) {
      context.handle(_baseUrlMeta,
          baseUrl.isAcceptableOrUnknown(data['base_url']!, _baseUrlMeta));
    } else if (isInserting) {
      context.missing(_baseUrlMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    } else if (isInserting) {
      context.missing(_websiteMeta);
    }
    if (data.containsKey('signing_key_fingerprint')) {
      context.handle(
          _signingKeyFingerprintMeta,
          signingKeyFingerprint.isAcceptableOrUnknown(
              data['signing_key_fingerprint']!, _signingKeyFingerprintMeta));
    } else if (isInserting) {
      context.missing(_signingKeyFingerprintMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {baseUrl};
  @override
  ExtensionRepo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExtensionRepo(
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
      baseUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}base_url'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      website: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}website'])!,
      signingKeyFingerprint: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}signing_key_fingerprint'])!,
    );
  }

  @override
  $ExtensionReposTable createAlias(String alias) {
    return $ExtensionReposTable(attachedDatabase, alias);
  }
}

class ExtensionRepo extends DataClass implements Insertable<ExtensionRepo> {
  final String? icon;
  final String baseUrl;
  final String displayName;
  final String website;
  final String signingKeyFingerprint;
  const ExtensionRepo(
      {this.icon,
      required this.baseUrl,
      required this.displayName,
      required this.website,
      required this.signingKeyFingerprint});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    map['base_url'] = Variable<String>(baseUrl);
    map['display_name'] = Variable<String>(displayName);
    map['website'] = Variable<String>(website);
    map['signing_key_fingerprint'] = Variable<String>(signingKeyFingerprint);
    return map;
  }

  ExtensionReposCompanion toCompanion(bool nullToAbsent) {
    return ExtensionReposCompanion(
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      baseUrl: Value(baseUrl),
      displayName: Value(displayName),
      website: Value(website),
      signingKeyFingerprint: Value(signingKeyFingerprint),
    );
  }

  factory ExtensionRepo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExtensionRepo(
      icon: serializer.fromJson<String?>(json['icon']),
      baseUrl: serializer.fromJson<String>(json['baseUrl']),
      displayName: serializer.fromJson<String>(json['displayName']),
      website: serializer.fromJson<String>(json['website']),
      signingKeyFingerprint:
          serializer.fromJson<String>(json['signingKeyFingerprint']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'icon': serializer.toJson<String?>(icon),
      'baseUrl': serializer.toJson<String>(baseUrl),
      'displayName': serializer.toJson<String>(displayName),
      'website': serializer.toJson<String>(website),
      'signingKeyFingerprint': serializer.toJson<String>(signingKeyFingerprint),
    };
  }

  ExtensionRepo copyWith(
          {Value<String?> icon = const Value.absent(),
          String? baseUrl,
          String? displayName,
          String? website,
          String? signingKeyFingerprint}) =>
      ExtensionRepo(
        icon: icon.present ? icon.value : this.icon,
        baseUrl: baseUrl ?? this.baseUrl,
        displayName: displayName ?? this.displayName,
        website: website ?? this.website,
        signingKeyFingerprint:
            signingKeyFingerprint ?? this.signingKeyFingerprint,
      );
  ExtensionRepo copyWithCompanion(ExtensionReposCompanion data) {
    return ExtensionRepo(
      icon: data.icon.present ? data.icon.value : this.icon,
      baseUrl: data.baseUrl.present ? data.baseUrl.value : this.baseUrl,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      website: data.website.present ? data.website.value : this.website,
      signingKeyFingerprint: data.signingKeyFingerprint.present
          ? data.signingKeyFingerprint.value
          : this.signingKeyFingerprint,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExtensionRepo(')
          ..write('icon: $icon, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('displayName: $displayName, ')
          ..write('website: $website, ')
          ..write('signingKeyFingerprint: $signingKeyFingerprint')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(icon, baseUrl, displayName, website, signingKeyFingerprint);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExtensionRepo &&
          other.icon == this.icon &&
          other.baseUrl == this.baseUrl &&
          other.displayName == this.displayName &&
          other.website == this.website &&
          other.signingKeyFingerprint == this.signingKeyFingerprint);
}

class ExtensionReposCompanion extends UpdateCompanion<ExtensionRepo> {
  final Value<String?> icon;
  final Value<String> baseUrl;
  final Value<String> displayName;
  final Value<String> website;
  final Value<String> signingKeyFingerprint;
  final Value<int> rowid;
  const ExtensionReposCompanion({
    this.icon = const Value.absent(),
    this.baseUrl = const Value.absent(),
    this.displayName = const Value.absent(),
    this.website = const Value.absent(),
    this.signingKeyFingerprint = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExtensionReposCompanion.insert({
    this.icon = const Value.absent(),
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
    this.rowid = const Value.absent(),
  })  : baseUrl = Value(baseUrl),
        displayName = Value(displayName),
        website = Value(website),
        signingKeyFingerprint = Value(signingKeyFingerprint);
  static Insertable<ExtensionRepo> custom({
    Expression<String>? icon,
    Expression<String>? baseUrl,
    Expression<String>? displayName,
    Expression<String>? website,
    Expression<String>? signingKeyFingerprint,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (icon != null) 'icon': icon,
      if (baseUrl != null) 'base_url': baseUrl,
      if (displayName != null) 'display_name': displayName,
      if (website != null) 'website': website,
      if (signingKeyFingerprint != null)
        'signing_key_fingerprint': signingKeyFingerprint,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExtensionReposCompanion copyWith(
      {Value<String?>? icon,
      Value<String>? baseUrl,
      Value<String>? displayName,
      Value<String>? website,
      Value<String>? signingKeyFingerprint,
      Value<int>? rowid}) {
    return ExtensionReposCompanion(
      icon: icon ?? this.icon,
      baseUrl: baseUrl ?? this.baseUrl,
      displayName: displayName ?? this.displayName,
      website: website ?? this.website,
      signingKeyFingerprint:
          signingKeyFingerprint ?? this.signingKeyFingerprint,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (baseUrl.present) {
      map['base_url'] = Variable<String>(baseUrl.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (signingKeyFingerprint.present) {
      map['signing_key_fingerprint'] =
          Variable<String>(signingKeyFingerprint.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExtensionReposCompanion(')
          ..write('icon: $icon, ')
          ..write('baseUrl: $baseUrl, ')
          ..write('displayName: $displayName, ')
          ..write('website: $website, ')
          ..write('signingKeyFingerprint: $signingKeyFingerprint, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InstalledExtensionsTable extends InstalledExtensions
    with TableInfo<$InstalledExtensionsTable, InstalledExtension> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InstalledExtensionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _repoBaseUrlMeta =
      const VerificationMeta('repoBaseUrl');
  @override
  late final GeneratedColumn<String> repoBaseUrl = GeneratedColumn<String>(
      'repo_base_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pkgNameMeta =
      const VerificationMeta('pkgName');
  @override
  late final GeneratedColumn<String> pkgName = GeneratedColumn<String>(
      'pkg_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _zipNameMeta =
      const VerificationMeta('zipName');
  @override
  late final GeneratedColumn<String> zipName = GeneratedColumn<String>(
      'zip_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pythonVersionMeta =
      const VerificationMeta('pythonVersion');
  @override
  late final GeneratedColumn<int> pythonVersion = GeneratedColumn<int>(
      'python_version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _langMeta = const VerificationMeta('lang');
  @override
  late final GeneratedColumn<String> lang = GeneratedColumn<String>(
      'lang', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isNsfwMeta = const VerificationMeta('isNsfw');
  @override
  late final GeneratedColumn<bool> isNsfw = GeneratedColumn<bool>(
      'is_nsfw', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_nsfw" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        repoBaseUrl,
        pkgName,
        displayName,
        zipName,
        version,
        pythonVersion,
        lang,
        isNsfw
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'installed_extensions';
  @override
  VerificationContext validateIntegrity(Insertable<InstalledExtension> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('repo_base_url')) {
      context.handle(
          _repoBaseUrlMeta,
          repoBaseUrl.isAcceptableOrUnknown(
              data['repo_base_url']!, _repoBaseUrlMeta));
    } else if (isInserting) {
      context.missing(_repoBaseUrlMeta);
    }
    if (data.containsKey('pkg_name')) {
      context.handle(_pkgNameMeta,
          pkgName.isAcceptableOrUnknown(data['pkg_name']!, _pkgNameMeta));
    } else if (isInserting) {
      context.missing(_pkgNameMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('zip_name')) {
      context.handle(_zipNameMeta,
          zipName.isAcceptableOrUnknown(data['zip_name']!, _zipNameMeta));
    } else if (isInserting) {
      context.missing(_zipNameMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('python_version')) {
      context.handle(
          _pythonVersionMeta,
          pythonVersion.isAcceptableOrUnknown(
              data['python_version']!, _pythonVersionMeta));
    } else if (isInserting) {
      context.missing(_pythonVersionMeta);
    }
    if (data.containsKey('lang')) {
      context.handle(
          _langMeta, lang.isAcceptableOrUnknown(data['lang']!, _langMeta));
    }
    if (data.containsKey('is_nsfw')) {
      context.handle(_isNsfwMeta,
          isNsfw.isAcceptableOrUnknown(data['is_nsfw']!, _isNsfwMeta));
    } else if (isInserting) {
      context.missing(_isNsfwMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pkgName};
  @override
  InstalledExtension map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InstalledExtension(
      repoBaseUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}repo_base_url'])!,
      pkgName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pkg_name'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      zipName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zip_name'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      pythonVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}python_version'])!,
      lang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lang']),
      isNsfw: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_nsfw'])!,
    );
  }

  @override
  $InstalledExtensionsTable createAlias(String alias) {
    return $InstalledExtensionsTable(attachedDatabase, alias);
  }
}

class InstalledExtension extends DataClass
    implements Insertable<InstalledExtension> {
  final String repoBaseUrl;
  final String pkgName;
  final String displayName;
  final String zipName;
  final int version;
  final int pythonVersion;
  final String? lang;
  final bool isNsfw;
  const InstalledExtension(
      {required this.repoBaseUrl,
      required this.pkgName,
      required this.displayName,
      required this.zipName,
      required this.version,
      required this.pythonVersion,
      this.lang,
      required this.isNsfw});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['repo_base_url'] = Variable<String>(repoBaseUrl);
    map['pkg_name'] = Variable<String>(pkgName);
    map['display_name'] = Variable<String>(displayName);
    map['zip_name'] = Variable<String>(zipName);
    map['version'] = Variable<int>(version);
    map['python_version'] = Variable<int>(pythonVersion);
    if (!nullToAbsent || lang != null) {
      map['lang'] = Variable<String>(lang);
    }
    map['is_nsfw'] = Variable<bool>(isNsfw);
    return map;
  }

  InstalledExtensionsCompanion toCompanion(bool nullToAbsent) {
    return InstalledExtensionsCompanion(
      repoBaseUrl: Value(repoBaseUrl),
      pkgName: Value(pkgName),
      displayName: Value(displayName),
      zipName: Value(zipName),
      version: Value(version),
      pythonVersion: Value(pythonVersion),
      lang: lang == null && nullToAbsent ? const Value.absent() : Value(lang),
      isNsfw: Value(isNsfw),
    );
  }

  factory InstalledExtension.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InstalledExtension(
      repoBaseUrl: serializer.fromJson<String>(json['repoBaseUrl']),
      pkgName: serializer.fromJson<String>(json['pkgName']),
      displayName: serializer.fromJson<String>(json['displayName']),
      zipName: serializer.fromJson<String>(json['zipName']),
      version: serializer.fromJson<int>(json['version']),
      pythonVersion: serializer.fromJson<int>(json['pythonVersion']),
      lang: serializer.fromJson<String?>(json['lang']),
      isNsfw: serializer.fromJson<bool>(json['isNsfw']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'repoBaseUrl': serializer.toJson<String>(repoBaseUrl),
      'pkgName': serializer.toJson<String>(pkgName),
      'displayName': serializer.toJson<String>(displayName),
      'zipName': serializer.toJson<String>(zipName),
      'version': serializer.toJson<int>(version),
      'pythonVersion': serializer.toJson<int>(pythonVersion),
      'lang': serializer.toJson<String?>(lang),
      'isNsfw': serializer.toJson<bool>(isNsfw),
    };
  }

  InstalledExtension copyWith(
          {String? repoBaseUrl,
          String? pkgName,
          String? displayName,
          String? zipName,
          int? version,
          int? pythonVersion,
          Value<String?> lang = const Value.absent(),
          bool? isNsfw}) =>
      InstalledExtension(
        repoBaseUrl: repoBaseUrl ?? this.repoBaseUrl,
        pkgName: pkgName ?? this.pkgName,
        displayName: displayName ?? this.displayName,
        zipName: zipName ?? this.zipName,
        version: version ?? this.version,
        pythonVersion: pythonVersion ?? this.pythonVersion,
        lang: lang.present ? lang.value : this.lang,
        isNsfw: isNsfw ?? this.isNsfw,
      );
  InstalledExtension copyWithCompanion(InstalledExtensionsCompanion data) {
    return InstalledExtension(
      repoBaseUrl:
          data.repoBaseUrl.present ? data.repoBaseUrl.value : this.repoBaseUrl,
      pkgName: data.pkgName.present ? data.pkgName.value : this.pkgName,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      zipName: data.zipName.present ? data.zipName.value : this.zipName,
      version: data.version.present ? data.version.value : this.version,
      pythonVersion: data.pythonVersion.present
          ? data.pythonVersion.value
          : this.pythonVersion,
      lang: data.lang.present ? data.lang.value : this.lang,
      isNsfw: data.isNsfw.present ? data.isNsfw.value : this.isNsfw,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InstalledExtension(')
          ..write('repoBaseUrl: $repoBaseUrl, ')
          ..write('pkgName: $pkgName, ')
          ..write('displayName: $displayName, ')
          ..write('zipName: $zipName, ')
          ..write('version: $version, ')
          ..write('pythonVersion: $pythonVersion, ')
          ..write('lang: $lang, ')
          ..write('isNsfw: $isNsfw')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(repoBaseUrl, pkgName, displayName, zipName,
      version, pythonVersion, lang, isNsfw);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstalledExtension &&
          other.repoBaseUrl == this.repoBaseUrl &&
          other.pkgName == this.pkgName &&
          other.displayName == this.displayName &&
          other.zipName == this.zipName &&
          other.version == this.version &&
          other.pythonVersion == this.pythonVersion &&
          other.lang == this.lang &&
          other.isNsfw == this.isNsfw);
}

class InstalledExtensionsCompanion extends UpdateCompanion<InstalledExtension> {
  final Value<String> repoBaseUrl;
  final Value<String> pkgName;
  final Value<String> displayName;
  final Value<String> zipName;
  final Value<int> version;
  final Value<int> pythonVersion;
  final Value<String?> lang;
  final Value<bool> isNsfw;
  final Value<int> rowid;
  const InstalledExtensionsCompanion({
    this.repoBaseUrl = const Value.absent(),
    this.pkgName = const Value.absent(),
    this.displayName = const Value.absent(),
    this.zipName = const Value.absent(),
    this.version = const Value.absent(),
    this.pythonVersion = const Value.absent(),
    this.lang = const Value.absent(),
    this.isNsfw = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InstalledExtensionsCompanion.insert({
    required String repoBaseUrl,
    required String pkgName,
    required String displayName,
    required String zipName,
    required int version,
    required int pythonVersion,
    this.lang = const Value.absent(),
    required bool isNsfw,
    this.rowid = const Value.absent(),
  })  : repoBaseUrl = Value(repoBaseUrl),
        pkgName = Value(pkgName),
        displayName = Value(displayName),
        zipName = Value(zipName),
        version = Value(version),
        pythonVersion = Value(pythonVersion),
        isNsfw = Value(isNsfw);
  static Insertable<InstalledExtension> custom({
    Expression<String>? repoBaseUrl,
    Expression<String>? pkgName,
    Expression<String>? displayName,
    Expression<String>? zipName,
    Expression<int>? version,
    Expression<int>? pythonVersion,
    Expression<String>? lang,
    Expression<bool>? isNsfw,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (repoBaseUrl != null) 'repo_base_url': repoBaseUrl,
      if (pkgName != null) 'pkg_name': pkgName,
      if (displayName != null) 'display_name': displayName,
      if (zipName != null) 'zip_name': zipName,
      if (version != null) 'version': version,
      if (pythonVersion != null) 'python_version': pythonVersion,
      if (lang != null) 'lang': lang,
      if (isNsfw != null) 'is_nsfw': isNsfw,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InstalledExtensionsCompanion copyWith(
      {Value<String>? repoBaseUrl,
      Value<String>? pkgName,
      Value<String>? displayName,
      Value<String>? zipName,
      Value<int>? version,
      Value<int>? pythonVersion,
      Value<String?>? lang,
      Value<bool>? isNsfw,
      Value<int>? rowid}) {
    return InstalledExtensionsCompanion(
      repoBaseUrl: repoBaseUrl ?? this.repoBaseUrl,
      pkgName: pkgName ?? this.pkgName,
      displayName: displayName ?? this.displayName,
      zipName: zipName ?? this.zipName,
      version: version ?? this.version,
      pythonVersion: pythonVersion ?? this.pythonVersion,
      lang: lang ?? this.lang,
      isNsfw: isNsfw ?? this.isNsfw,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (repoBaseUrl.present) {
      map['repo_base_url'] = Variable<String>(repoBaseUrl.value);
    }
    if (pkgName.present) {
      map['pkg_name'] = Variable<String>(pkgName.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (zipName.present) {
      map['zip_name'] = Variable<String>(zipName.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (pythonVersion.present) {
      map['python_version'] = Variable<int>(pythonVersion.value);
    }
    if (lang.present) {
      map['lang'] = Variable<String>(lang.value);
    }
    if (isNsfw.present) {
      map['is_nsfw'] = Variable<bool>(isNsfw.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InstalledExtensionsCompanion(')
          ..write('repoBaseUrl: $repoBaseUrl, ')
          ..write('pkgName: $pkgName, ')
          ..write('displayName: $displayName, ')
          ..write('zipName: $zipName, ')
          ..write('version: $version, ')
          ..write('pythonVersion: $pythonVersion, ')
          ..write('lang: $lang, ')
          ..write('isNsfw: $isNsfw, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SuggestionsTable extends Suggestions
    with TableInfo<$SuggestionsTable, Suggestion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuggestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _keywordsMeta =
      const VerificationMeta('keywords');
  @override
  late final GeneratedColumn<String> keywords = GeneratedColumn<String>(
      'keywords', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latestUsedAtMeta =
      const VerificationMeta('latestUsedAt');
  @override
  late final GeneratedColumn<DateTime> latestUsedAt = GeneratedColumn<DateTime>(
      'latest_used_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, keywords, latestUsedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suggestions';
  @override
  VerificationContext validateIntegrity(Insertable<Suggestion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('keywords')) {
      context.handle(_keywordsMeta,
          keywords.isAcceptableOrUnknown(data['keywords']!, _keywordsMeta));
    } else if (isInserting) {
      context.missing(_keywordsMeta);
    }
    if (data.containsKey('latest_used_at')) {
      context.handle(
          _latestUsedAtMeta,
          latestUsedAt.isAcceptableOrUnknown(
              data['latest_used_at']!, _latestUsedAtMeta));
    } else if (isInserting) {
      context.missing(_latestUsedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Suggestion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Suggestion(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      keywords: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}keywords'])!,
      latestUsedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}latest_used_at'])!,
    );
  }

  @override
  $SuggestionsTable createAlias(String alias) {
    return $SuggestionsTable(attachedDatabase, alias);
  }
}

class Suggestion extends DataClass implements Insertable<Suggestion> {
  final String id;
  final String keywords;
  final DateTime latestUsedAt;
  const Suggestion(
      {required this.id, required this.keywords, required this.latestUsedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['keywords'] = Variable<String>(keywords);
    map['latest_used_at'] = Variable<DateTime>(latestUsedAt);
    return map;
  }

  SuggestionsCompanion toCompanion(bool nullToAbsent) {
    return SuggestionsCompanion(
      id: Value(id),
      keywords: Value(keywords),
      latestUsedAt: Value(latestUsedAt),
    );
  }

  factory Suggestion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Suggestion(
      id: serializer.fromJson<String>(json['id']),
      keywords: serializer.fromJson<String>(json['keywords']),
      latestUsedAt: serializer.fromJson<DateTime>(json['latestUsedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'keywords': serializer.toJson<String>(keywords),
      'latestUsedAt': serializer.toJson<DateTime>(latestUsedAt),
    };
  }

  Suggestion copyWith({String? id, String? keywords, DateTime? latestUsedAt}) =>
      Suggestion(
        id: id ?? this.id,
        keywords: keywords ?? this.keywords,
        latestUsedAt: latestUsedAt ?? this.latestUsedAt,
      );
  Suggestion copyWithCompanion(SuggestionsCompanion data) {
    return Suggestion(
      id: data.id.present ? data.id.value : this.id,
      keywords: data.keywords.present ? data.keywords.value : this.keywords,
      latestUsedAt: data.latestUsedAt.present
          ? data.latestUsedAt.value
          : this.latestUsedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Suggestion(')
          ..write('id: $id, ')
          ..write('keywords: $keywords, ')
          ..write('latestUsedAt: $latestUsedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, keywords, latestUsedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Suggestion &&
          other.id == this.id &&
          other.keywords == this.keywords &&
          other.latestUsedAt == this.latestUsedAt);
}

class SuggestionsCompanion extends UpdateCompanion<Suggestion> {
  final Value<String> id;
  final Value<String> keywords;
  final Value<DateTime> latestUsedAt;
  final Value<int> rowid;
  const SuggestionsCompanion({
    this.id = const Value.absent(),
    this.keywords = const Value.absent(),
    this.latestUsedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SuggestionsCompanion.insert({
    required String id,
    required String keywords,
    required DateTime latestUsedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        keywords = Value(keywords),
        latestUsedAt = Value(latestUsedAt);
  static Insertable<Suggestion> custom({
    Expression<String>? id,
    Expression<String>? keywords,
    Expression<DateTime>? latestUsedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (keywords != null) 'keywords': keywords,
      if (latestUsedAt != null) 'latest_used_at': latestUsedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SuggestionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? keywords,
      Value<DateTime>? latestUsedAt,
      Value<int>? rowid}) {
    return SuggestionsCompanion(
      id: id ?? this.id,
      keywords: keywords ?? this.keywords,
      latestUsedAt: latestUsedAt ?? this.latestUsedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (keywords.present) {
      map['keywords'] = Variable<String>(keywords.value);
    }
    if (latestUsedAt.present) {
      map['latest_used_at'] = Variable<DateTime>(latestUsedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuggestionsCompanion(')
          ..write('id: $id, ')
          ..write('keywords: $keywords, ')
          ..write('latestUsedAt: $latestUsedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExtensionReposTable extensionRepos = $ExtensionReposTable(this);
  late final $InstalledExtensionsTable installedExtensions =
      $InstalledExtensionsTable(this);
  late final $SuggestionsTable suggestions = $SuggestionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [extensionRepos, installedExtensions, suggestions];
}

typedef $$ExtensionReposTableCreateCompanionBuilder = ExtensionReposCompanion
    Function({
  Value<String?> icon,
  required String baseUrl,
  required String displayName,
  required String website,
  required String signingKeyFingerprint,
  Value<int> rowid,
});
typedef $$ExtensionReposTableUpdateCompanionBuilder = ExtensionReposCompanion
    Function({
  Value<String?> icon,
  Value<String> baseUrl,
  Value<String> displayName,
  Value<String> website,
  Value<String> signingKeyFingerprint,
  Value<int> rowid,
});

class $$ExtensionReposTableFilterComposer
    extends Composer<_$AppDatabase, $ExtensionReposTable> {
  $$ExtensionReposTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get baseUrl => $composableBuilder(
      column: $table.baseUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get signingKeyFingerprint => $composableBuilder(
      column: $table.signingKeyFingerprint,
      builder: (column) => ColumnFilters(column));
}

class $$ExtensionReposTableOrderingComposer
    extends Composer<_$AppDatabase, $ExtensionReposTable> {
  $$ExtensionReposTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get baseUrl => $composableBuilder(
      column: $table.baseUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get signingKeyFingerprint => $composableBuilder(
      column: $table.signingKeyFingerprint,
      builder: (column) => ColumnOrderings(column));
}

class $$ExtensionReposTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExtensionReposTable> {
  $$ExtensionReposTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get baseUrl =>
      $composableBuilder(column: $table.baseUrl, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get signingKeyFingerprint => $composableBuilder(
      column: $table.signingKeyFingerprint, builder: (column) => column);
}

class $$ExtensionReposTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExtensionReposTable,
    ExtensionRepo,
    $$ExtensionReposTableFilterComposer,
    $$ExtensionReposTableOrderingComposer,
    $$ExtensionReposTableAnnotationComposer,
    $$ExtensionReposTableCreateCompanionBuilder,
    $$ExtensionReposTableUpdateCompanionBuilder,
    (
      ExtensionRepo,
      BaseReferences<_$AppDatabase, $ExtensionReposTable, ExtensionRepo>
    ),
    ExtensionRepo,
    PrefetchHooks Function()> {
  $$ExtensionReposTableTableManager(
      _$AppDatabase db, $ExtensionReposTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExtensionReposTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExtensionReposTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExtensionReposTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String?> icon = const Value.absent(),
            Value<String> baseUrl = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<String> website = const Value.absent(),
            Value<String> signingKeyFingerprint = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExtensionReposCompanion(
            icon: icon,
            baseUrl: baseUrl,
            displayName: displayName,
            website: website,
            signingKeyFingerprint: signingKeyFingerprint,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String?> icon = const Value.absent(),
            required String baseUrl,
            required String displayName,
            required String website,
            required String signingKeyFingerprint,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExtensionReposCompanion.insert(
            icon: icon,
            baseUrl: baseUrl,
            displayName: displayName,
            website: website,
            signingKeyFingerprint: signingKeyFingerprint,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExtensionReposTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExtensionReposTable,
    ExtensionRepo,
    $$ExtensionReposTableFilterComposer,
    $$ExtensionReposTableOrderingComposer,
    $$ExtensionReposTableAnnotationComposer,
    $$ExtensionReposTableCreateCompanionBuilder,
    $$ExtensionReposTableUpdateCompanionBuilder,
    (
      ExtensionRepo,
      BaseReferences<_$AppDatabase, $ExtensionReposTable, ExtensionRepo>
    ),
    ExtensionRepo,
    PrefetchHooks Function()>;
typedef $$InstalledExtensionsTableCreateCompanionBuilder
    = InstalledExtensionsCompanion Function({
  required String repoBaseUrl,
  required String pkgName,
  required String displayName,
  required String zipName,
  required int version,
  required int pythonVersion,
  Value<String?> lang,
  required bool isNsfw,
  Value<int> rowid,
});
typedef $$InstalledExtensionsTableUpdateCompanionBuilder
    = InstalledExtensionsCompanion Function({
  Value<String> repoBaseUrl,
  Value<String> pkgName,
  Value<String> displayName,
  Value<String> zipName,
  Value<int> version,
  Value<int> pythonVersion,
  Value<String?> lang,
  Value<bool> isNsfw,
  Value<int> rowid,
});

class $$InstalledExtensionsTableFilterComposer
    extends Composer<_$AppDatabase, $InstalledExtensionsTable> {
  $$InstalledExtensionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get repoBaseUrl => $composableBuilder(
      column: $table.repoBaseUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pkgName => $composableBuilder(
      column: $table.pkgName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get zipName => $composableBuilder(
      column: $table.zipName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pythonVersion => $composableBuilder(
      column: $table.pythonVersion, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lang => $composableBuilder(
      column: $table.lang, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isNsfw => $composableBuilder(
      column: $table.isNsfw, builder: (column) => ColumnFilters(column));
}

class $$InstalledExtensionsTableOrderingComposer
    extends Composer<_$AppDatabase, $InstalledExtensionsTable> {
  $$InstalledExtensionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get repoBaseUrl => $composableBuilder(
      column: $table.repoBaseUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pkgName => $composableBuilder(
      column: $table.pkgName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get zipName => $composableBuilder(
      column: $table.zipName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pythonVersion => $composableBuilder(
      column: $table.pythonVersion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lang => $composableBuilder(
      column: $table.lang, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isNsfw => $composableBuilder(
      column: $table.isNsfw, builder: (column) => ColumnOrderings(column));
}

class $$InstalledExtensionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InstalledExtensionsTable> {
  $$InstalledExtensionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get repoBaseUrl => $composableBuilder(
      column: $table.repoBaseUrl, builder: (column) => column);

  GeneratedColumn<String> get pkgName =>
      $composableBuilder(column: $table.pkgName, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get zipName =>
      $composableBuilder(column: $table.zipName, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<int> get pythonVersion => $composableBuilder(
      column: $table.pythonVersion, builder: (column) => column);

  GeneratedColumn<String> get lang =>
      $composableBuilder(column: $table.lang, builder: (column) => column);

  GeneratedColumn<bool> get isNsfw =>
      $composableBuilder(column: $table.isNsfw, builder: (column) => column);
}

class $$InstalledExtensionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InstalledExtensionsTable,
    InstalledExtension,
    $$InstalledExtensionsTableFilterComposer,
    $$InstalledExtensionsTableOrderingComposer,
    $$InstalledExtensionsTableAnnotationComposer,
    $$InstalledExtensionsTableCreateCompanionBuilder,
    $$InstalledExtensionsTableUpdateCompanionBuilder,
    (
      InstalledExtension,
      BaseReferences<_$AppDatabase, $InstalledExtensionsTable,
          InstalledExtension>
    ),
    InstalledExtension,
    PrefetchHooks Function()> {
  $$InstalledExtensionsTableTableManager(
      _$AppDatabase db, $InstalledExtensionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InstalledExtensionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InstalledExtensionsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InstalledExtensionsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> repoBaseUrl = const Value.absent(),
            Value<String> pkgName = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<String> zipName = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<int> pythonVersion = const Value.absent(),
            Value<String?> lang = const Value.absent(),
            Value<bool> isNsfw = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InstalledExtensionsCompanion(
            repoBaseUrl: repoBaseUrl,
            pkgName: pkgName,
            displayName: displayName,
            zipName: zipName,
            version: version,
            pythonVersion: pythonVersion,
            lang: lang,
            isNsfw: isNsfw,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String repoBaseUrl,
            required String pkgName,
            required String displayName,
            required String zipName,
            required int version,
            required int pythonVersion,
            Value<String?> lang = const Value.absent(),
            required bool isNsfw,
            Value<int> rowid = const Value.absent(),
          }) =>
              InstalledExtensionsCompanion.insert(
            repoBaseUrl: repoBaseUrl,
            pkgName: pkgName,
            displayName: displayName,
            zipName: zipName,
            version: version,
            pythonVersion: pythonVersion,
            lang: lang,
            isNsfw: isNsfw,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InstalledExtensionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $InstalledExtensionsTable,
    InstalledExtension,
    $$InstalledExtensionsTableFilterComposer,
    $$InstalledExtensionsTableOrderingComposer,
    $$InstalledExtensionsTableAnnotationComposer,
    $$InstalledExtensionsTableCreateCompanionBuilder,
    $$InstalledExtensionsTableUpdateCompanionBuilder,
    (
      InstalledExtension,
      BaseReferences<_$AppDatabase, $InstalledExtensionsTable,
          InstalledExtension>
    ),
    InstalledExtension,
    PrefetchHooks Function()>;
typedef $$SuggestionsTableCreateCompanionBuilder = SuggestionsCompanion
    Function({
  required String id,
  required String keywords,
  required DateTime latestUsedAt,
  Value<int> rowid,
});
typedef $$SuggestionsTableUpdateCompanionBuilder = SuggestionsCompanion
    Function({
  Value<String> id,
  Value<String> keywords,
  Value<DateTime> latestUsedAt,
  Value<int> rowid,
});

class $$SuggestionsTableFilterComposer
    extends Composer<_$AppDatabase, $SuggestionsTable> {
  $$SuggestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get keywords => $composableBuilder(
      column: $table.keywords, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get latestUsedAt => $composableBuilder(
      column: $table.latestUsedAt, builder: (column) => ColumnFilters(column));
}

class $$SuggestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SuggestionsTable> {
  $$SuggestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get keywords => $composableBuilder(
      column: $table.keywords, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get latestUsedAt => $composableBuilder(
      column: $table.latestUsedAt,
      builder: (column) => ColumnOrderings(column));
}

class $$SuggestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SuggestionsTable> {
  $$SuggestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get keywords =>
      $composableBuilder(column: $table.keywords, builder: (column) => column);

  GeneratedColumn<DateTime> get latestUsedAt => $composableBuilder(
      column: $table.latestUsedAt, builder: (column) => column);
}

class $$SuggestionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SuggestionsTable,
    Suggestion,
    $$SuggestionsTableFilterComposer,
    $$SuggestionsTableOrderingComposer,
    $$SuggestionsTableAnnotationComposer,
    $$SuggestionsTableCreateCompanionBuilder,
    $$SuggestionsTableUpdateCompanionBuilder,
    (Suggestion, BaseReferences<_$AppDatabase, $SuggestionsTable, Suggestion>),
    Suggestion,
    PrefetchHooks Function()> {
  $$SuggestionsTableTableManager(_$AppDatabase db, $SuggestionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuggestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuggestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuggestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> keywords = const Value.absent(),
            Value<DateTime> latestUsedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SuggestionsCompanion(
            id: id,
            keywords: keywords,
            latestUsedAt: latestUsedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String keywords,
            required DateTime latestUsedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              SuggestionsCompanion.insert(
            id: id,
            keywords: keywords,
            latestUsedAt: latestUsedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SuggestionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SuggestionsTable,
    Suggestion,
    $$SuggestionsTableFilterComposer,
    $$SuggestionsTableOrderingComposer,
    $$SuggestionsTableAnnotationComposer,
    $$SuggestionsTableCreateCompanionBuilder,
    $$SuggestionsTableUpdateCompanionBuilder,
    (Suggestion, BaseReferences<_$AppDatabase, $SuggestionsTable, Suggestion>),
    Suggestion,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExtensionReposTableTableManager get extensionRepos =>
      $$ExtensionReposTableTableManager(_db, _db.extensionRepos);
  $$InstalledExtensionsTableTableManager get installedExtensions =>
      $$InstalledExtensionsTableTableManager(_db, _db.installedExtensions);
  $$SuggestionsTableTableManager get suggestions =>
      $$SuggestionsTableTableManager(_db, _db.suggestions);
}
