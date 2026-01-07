// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ReposTable extends Repos with TableInfo<$ReposTable, Repo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReposTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'repos';
  @override
  VerificationContext validateIntegrity(Insertable<Repo> instance,
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
  Repo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Repo(
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
  $ReposTable createAlias(String alias) {
    return $ReposTable(attachedDatabase, alias);
  }
}

class Repo extends DataClass implements Insertable<Repo> {
  final String? icon;
  final String baseUrl;
  final String displayName;
  final String website;
  final String signingKeyFingerprint;
  const Repo(
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

  ReposCompanion toCompanion(bool nullToAbsent) {
    return ReposCompanion(
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      baseUrl: Value(baseUrl),
      displayName: Value(displayName),
      website: Value(website),
      signingKeyFingerprint: Value(signingKeyFingerprint),
    );
  }

  factory Repo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Repo(
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

  Repo copyWith(
          {Value<String?> icon = const Value.absent(),
          String? baseUrl,
          String? displayName,
          String? website,
          String? signingKeyFingerprint}) =>
      Repo(
        icon: icon.present ? icon.value : this.icon,
        baseUrl: baseUrl ?? this.baseUrl,
        displayName: displayName ?? this.displayName,
        website: website ?? this.website,
        signingKeyFingerprint:
            signingKeyFingerprint ?? this.signingKeyFingerprint,
      );
  Repo copyWithCompanion(ReposCompanion data) {
    return Repo(
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
    return (StringBuffer('Repo(')
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
      (other is Repo &&
          other.icon == this.icon &&
          other.baseUrl == this.baseUrl &&
          other.displayName == this.displayName &&
          other.website == this.website &&
          other.signingKeyFingerprint == this.signingKeyFingerprint);
}

class ReposCompanion extends UpdateCompanion<Repo> {
  final Value<String?> icon;
  final Value<String> baseUrl;
  final Value<String> displayName;
  final Value<String> website;
  final Value<String> signingKeyFingerprint;
  final Value<int> rowid;
  const ReposCompanion({
    this.icon = const Value.absent(),
    this.baseUrl = const Value.absent(),
    this.displayName = const Value.absent(),
    this.website = const Value.absent(),
    this.signingKeyFingerprint = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReposCompanion.insert({
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
  static Insertable<Repo> custom({
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

  ReposCompanion copyWith(
      {Value<String?>? icon,
      Value<String>? baseUrl,
      Value<String>? displayName,
      Value<String>? website,
      Value<String>? signingKeyFingerprint,
      Value<int>? rowid}) {
    return ReposCompanion(
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
    return (StringBuffer('ReposCompanion(')
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
  List<GeneratedColumn> get $columns =>
      [pkgName, displayName, version, pythonVersion, lang, isNsfw];
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
      pkgName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pkg_name'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
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
  final String pkgName;
  final String displayName;
  final int version;
  final int pythonVersion;
  final String? lang;
  final bool isNsfw;
  const InstalledExtension(
      {required this.pkgName,
      required this.displayName,
      required this.version,
      required this.pythonVersion,
      this.lang,
      required this.isNsfw});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pkg_name'] = Variable<String>(pkgName);
    map['display_name'] = Variable<String>(displayName);
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
      pkgName: Value(pkgName),
      displayName: Value(displayName),
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
      pkgName: serializer.fromJson<String>(json['pkgName']),
      displayName: serializer.fromJson<String>(json['displayName']),
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
      'pkgName': serializer.toJson<String>(pkgName),
      'displayName': serializer.toJson<String>(displayName),
      'version': serializer.toJson<int>(version),
      'pythonVersion': serializer.toJson<int>(pythonVersion),
      'lang': serializer.toJson<String?>(lang),
      'isNsfw': serializer.toJson<bool>(isNsfw),
    };
  }

  InstalledExtension copyWith(
          {String? pkgName,
          String? displayName,
          int? version,
          int? pythonVersion,
          Value<String?> lang = const Value.absent(),
          bool? isNsfw}) =>
      InstalledExtension(
        pkgName: pkgName ?? this.pkgName,
        displayName: displayName ?? this.displayName,
        version: version ?? this.version,
        pythonVersion: pythonVersion ?? this.pythonVersion,
        lang: lang.present ? lang.value : this.lang,
        isNsfw: isNsfw ?? this.isNsfw,
      );
  InstalledExtension copyWithCompanion(InstalledExtensionsCompanion data) {
    return InstalledExtension(
      pkgName: data.pkgName.present ? data.pkgName.value : this.pkgName,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
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
          ..write('pkgName: $pkgName, ')
          ..write('displayName: $displayName, ')
          ..write('version: $version, ')
          ..write('pythonVersion: $pythonVersion, ')
          ..write('lang: $lang, ')
          ..write('isNsfw: $isNsfw')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(pkgName, displayName, version, pythonVersion, lang, isNsfw);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstalledExtension &&
          other.pkgName == this.pkgName &&
          other.displayName == this.displayName &&
          other.version == this.version &&
          other.pythonVersion == this.pythonVersion &&
          other.lang == this.lang &&
          other.isNsfw == this.isNsfw);
}

class InstalledExtensionsCompanion extends UpdateCompanion<InstalledExtension> {
  final Value<String> pkgName;
  final Value<String> displayName;
  final Value<int> version;
  final Value<int> pythonVersion;
  final Value<String?> lang;
  final Value<bool> isNsfw;
  final Value<int> rowid;
  const InstalledExtensionsCompanion({
    this.pkgName = const Value.absent(),
    this.displayName = const Value.absent(),
    this.version = const Value.absent(),
    this.pythonVersion = const Value.absent(),
    this.lang = const Value.absent(),
    this.isNsfw = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InstalledExtensionsCompanion.insert({
    required String pkgName,
    required String displayName,
    required int version,
    required int pythonVersion,
    this.lang = const Value.absent(),
    required bool isNsfw,
    this.rowid = const Value.absent(),
  })  : pkgName = Value(pkgName),
        displayName = Value(displayName),
        version = Value(version),
        pythonVersion = Value(pythonVersion),
        isNsfw = Value(isNsfw);
  static Insertable<InstalledExtension> custom({
    Expression<String>? pkgName,
    Expression<String>? displayName,
    Expression<int>? version,
    Expression<int>? pythonVersion,
    Expression<String>? lang,
    Expression<bool>? isNsfw,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pkgName != null) 'pkg_name': pkgName,
      if (displayName != null) 'display_name': displayName,
      if (version != null) 'version': version,
      if (pythonVersion != null) 'python_version': pythonVersion,
      if (lang != null) 'lang': lang,
      if (isNsfw != null) 'is_nsfw': isNsfw,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InstalledExtensionsCompanion copyWith(
      {Value<String>? pkgName,
      Value<String>? displayName,
      Value<int>? version,
      Value<int>? pythonVersion,
      Value<String?>? lang,
      Value<bool>? isNsfw,
      Value<int>? rowid}) {
    return InstalledExtensionsCompanion(
      pkgName: pkgName ?? this.pkgName,
      displayName: displayName ?? this.displayName,
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
    if (pkgName.present) {
      map['pkg_name'] = Variable<String>(pkgName.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
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
          ..write('pkgName: $pkgName, ')
          ..write('displayName: $displayName, ')
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

class $CollectionsTable extends Collections
    with TableInfo<$CollectionsTable, Collection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, name, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collections';
  @override
  VerificationContext validateIntegrity(Insertable<Collection> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Collection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Collection(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
    );
  }

  @override
  $CollectionsTable createAlias(String alias) {
    return $CollectionsTable(attachedDatabase, alias);
  }
}

class Collection extends DataClass implements Insertable<Collection> {
  final String id;
  final String name;
  final int sortOrder;
  const Collection(
      {required this.id, required this.name, required this.sortOrder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  CollectionsCompanion toCompanion(bool nullToAbsent) {
    return CollectionsCompanion(
      id: Value(id),
      name: Value(name),
      sortOrder: Value(sortOrder),
    );
  }

  factory Collection.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Collection(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  Collection copyWith({String? id, String? name, int? sortOrder}) => Collection(
        id: id ?? this.id,
        name: name ?? this.name,
        sortOrder: sortOrder ?? this.sortOrder,
      );
  Collection copyWithCompanion(CollectionsCompanion data) {
    return Collection(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Collection(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Collection &&
          other.id == this.id &&
          other.name == this.name &&
          other.sortOrder == this.sortOrder);
}

class CollectionsCompanion extends UpdateCompanion<Collection> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const CollectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollectionsCompanion.insert({
    required String id,
    required String name,
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Collection> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollectionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? sortOrder,
      Value<int>? rowid}) {
    return CollectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CollectionBoardRefsTable extends CollectionBoardRefs
    with TableInfo<$CollectionBoardRefsTable, CollectionBoardRef> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionBoardRefsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  @override
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES collections (id)'));
  static const VerificationMeta _extensionPkgNameMeta =
      const VerificationMeta('extensionPkgName');
  @override
  late final GeneratedColumn<String> extensionPkgName = GeneratedColumn<String>(
      'extension_pkg_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _siteIdMeta = const VerificationMeta('siteId');
  @override
  late final GeneratedColumn<String> siteId = GeneratedColumn<String>(
      'site_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _boardIdMeta =
      const VerificationMeta('boardId');
  @override
  late final GeneratedColumn<String> boardId = GeneratedColumn<String>(
      'board_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _boardNameMeta =
      const VerificationMeta('boardName');
  @override
  late final GeneratedColumn<String> boardName = GeneratedColumn<String>(
      'board_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns =>
      [collectionId, extensionPkgName, siteId, boardId, boardName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_board_refs';
  @override
  VerificationContext validateIntegrity(Insertable<CollectionBoardRef> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('extension_pkg_name')) {
      context.handle(
          _extensionPkgNameMeta,
          extensionPkgName.isAcceptableOrUnknown(
              data['extension_pkg_name']!, _extensionPkgNameMeta));
    } else if (isInserting) {
      context.missing(_extensionPkgNameMeta);
    }
    if (data.containsKey('site_id')) {
      context.handle(_siteIdMeta,
          siteId.isAcceptableOrUnknown(data['site_id']!, _siteIdMeta));
    } else if (isInserting) {
      context.missing(_siteIdMeta);
    }
    if (data.containsKey('board_id')) {
      context.handle(_boardIdMeta,
          boardId.isAcceptableOrUnknown(data['board_id']!, _boardIdMeta));
    } else if (isInserting) {
      context.missing(_boardIdMeta);
    }
    if (data.containsKey('board_name')) {
      context.handle(_boardNameMeta,
          boardName.isAcceptableOrUnknown(data['board_name']!, _boardNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey =>
      {collectionId, extensionPkgName, siteId, boardId};
  @override
  CollectionBoardRef map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionBoardRef(
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      extensionPkgName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}extension_pkg_name'])!,
      siteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}site_id'])!,
      boardId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_id'])!,
      boardName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}board_name'])!,
    );
  }

  @override
  $CollectionBoardRefsTable createAlias(String alias) {
    return $CollectionBoardRefsTable(attachedDatabase, alias);
  }
}

class CollectionBoardRef extends DataClass
    implements Insertable<CollectionBoardRef> {
  final String collectionId;
  final String extensionPkgName;
  final String siteId;
  final String boardId;
  final String boardName;
  const CollectionBoardRef(
      {required this.collectionId,
      required this.extensionPkgName,
      required this.siteId,
      required this.boardId,
      required this.boardName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['collection_id'] = Variable<String>(collectionId);
    map['extension_pkg_name'] = Variable<String>(extensionPkgName);
    map['site_id'] = Variable<String>(siteId);
    map['board_id'] = Variable<String>(boardId);
    map['board_name'] = Variable<String>(boardName);
    return map;
  }

  CollectionBoardRefsCompanion toCompanion(bool nullToAbsent) {
    return CollectionBoardRefsCompanion(
      collectionId: Value(collectionId),
      extensionPkgName: Value(extensionPkgName),
      siteId: Value(siteId),
      boardId: Value(boardId),
      boardName: Value(boardName),
    );
  }

  factory CollectionBoardRef.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionBoardRef(
      collectionId: serializer.fromJson<String>(json['collectionId']),
      extensionPkgName: serializer.fromJson<String>(json['extensionPkgName']),
      siteId: serializer.fromJson<String>(json['siteId']),
      boardId: serializer.fromJson<String>(json['boardId']),
      boardName: serializer.fromJson<String>(json['boardName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'collectionId': serializer.toJson<String>(collectionId),
      'extensionPkgName': serializer.toJson<String>(extensionPkgName),
      'siteId': serializer.toJson<String>(siteId),
      'boardId': serializer.toJson<String>(boardId),
      'boardName': serializer.toJson<String>(boardName),
    };
  }

  CollectionBoardRef copyWith(
          {String? collectionId,
          String? extensionPkgName,
          String? siteId,
          String? boardId,
          String? boardName}) =>
      CollectionBoardRef(
        collectionId: collectionId ?? this.collectionId,
        extensionPkgName: extensionPkgName ?? this.extensionPkgName,
        siteId: siteId ?? this.siteId,
        boardId: boardId ?? this.boardId,
        boardName: boardName ?? this.boardName,
      );
  CollectionBoardRef copyWithCompanion(CollectionBoardRefsCompanion data) {
    return CollectionBoardRef(
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      extensionPkgName: data.extensionPkgName.present
          ? data.extensionPkgName.value
          : this.extensionPkgName,
      siteId: data.siteId.present ? data.siteId.value : this.siteId,
      boardId: data.boardId.present ? data.boardId.value : this.boardId,
      boardName: data.boardName.present ? data.boardName.value : this.boardName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionBoardRef(')
          ..write('collectionId: $collectionId, ')
          ..write('extensionPkgName: $extensionPkgName, ')
          ..write('siteId: $siteId, ')
          ..write('boardId: $boardId, ')
          ..write('boardName: $boardName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(collectionId, extensionPkgName, siteId, boardId, boardName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionBoardRef &&
          other.collectionId == this.collectionId &&
          other.extensionPkgName == this.extensionPkgName &&
          other.siteId == this.siteId &&
          other.boardId == this.boardId &&
          other.boardName == this.boardName);
}

class CollectionBoardRefsCompanion extends UpdateCompanion<CollectionBoardRef> {
  final Value<String> collectionId;
  final Value<String> extensionPkgName;
  final Value<String> siteId;
  final Value<String> boardId;
  final Value<String> boardName;
  final Value<int> rowid;
  const CollectionBoardRefsCompanion({
    this.collectionId = const Value.absent(),
    this.extensionPkgName = const Value.absent(),
    this.siteId = const Value.absent(),
    this.boardId = const Value.absent(),
    this.boardName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollectionBoardRefsCompanion.insert({
    required String collectionId,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    this.boardName = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : collectionId = Value(collectionId),
        extensionPkgName = Value(extensionPkgName),
        siteId = Value(siteId),
        boardId = Value(boardId);
  static Insertable<CollectionBoardRef> custom({
    Expression<String>? collectionId,
    Expression<String>? extensionPkgName,
    Expression<String>? siteId,
    Expression<String>? boardId,
    Expression<String>? boardName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (collectionId != null) 'collection_id': collectionId,
      if (extensionPkgName != null) 'extension_pkg_name': extensionPkgName,
      if (siteId != null) 'site_id': siteId,
      if (boardId != null) 'board_id': boardId,
      if (boardName != null) 'board_name': boardName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollectionBoardRefsCompanion copyWith(
      {Value<String>? collectionId,
      Value<String>? extensionPkgName,
      Value<String>? siteId,
      Value<String>? boardId,
      Value<String>? boardName,
      Value<int>? rowid}) {
    return CollectionBoardRefsCompanion(
      collectionId: collectionId ?? this.collectionId,
      extensionPkgName: extensionPkgName ?? this.extensionPkgName,
      siteId: siteId ?? this.siteId,
      boardId: boardId ?? this.boardId,
      boardName: boardName ?? this.boardName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (extensionPkgName.present) {
      map['extension_pkg_name'] = Variable<String>(extensionPkgName.value);
    }
    if (siteId.present) {
      map['site_id'] = Variable<String>(siteId.value);
    }
    if (boardId.present) {
      map['board_id'] = Variable<String>(boardId.value);
    }
    if (boardName.present) {
      map['board_name'] = Variable<String>(boardName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionBoardRefsCompanion(')
          ..write('collectionId: $collectionId, ')
          ..write('extensionPkgName: $extensionPkgName, ')
          ..write('siteId: $siteId, ')
          ..write('boardId: $boardId, ')
          ..write('boardName: $boardName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ReposTable repos = $ReposTable(this);
  late final $InstalledExtensionsTable installedExtensions =
      $InstalledExtensionsTable(this);
  late final $SuggestionsTable suggestions = $SuggestionsTable(this);
  late final $CollectionsTable collections = $CollectionsTable(this);
  late final $CollectionBoardRefsTable collectionBoardRefs =
      $CollectionBoardRefsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        repos,
        installedExtensions,
        suggestions,
        collections,
        collectionBoardRefs
      ];
}

typedef $$ReposTableCreateCompanionBuilder = ReposCompanion Function({
  Value<String?> icon,
  required String baseUrl,
  required String displayName,
  required String website,
  required String signingKeyFingerprint,
  Value<int> rowid,
});
typedef $$ReposTableUpdateCompanionBuilder = ReposCompanion Function({
  Value<String?> icon,
  Value<String> baseUrl,
  Value<String> displayName,
  Value<String> website,
  Value<String> signingKeyFingerprint,
  Value<int> rowid,
});

class $$ReposTableFilterComposer extends Composer<_$AppDatabase, $ReposTable> {
  $$ReposTableFilterComposer({
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

class $$ReposTableOrderingComposer
    extends Composer<_$AppDatabase, $ReposTable> {
  $$ReposTableOrderingComposer({
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

class $$ReposTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReposTable> {
  $$ReposTableAnnotationComposer({
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

class $$ReposTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReposTable,
    Repo,
    $$ReposTableFilterComposer,
    $$ReposTableOrderingComposer,
    $$ReposTableAnnotationComposer,
    $$ReposTableCreateCompanionBuilder,
    $$ReposTableUpdateCompanionBuilder,
    (Repo, BaseReferences<_$AppDatabase, $ReposTable, Repo>),
    Repo,
    PrefetchHooks Function()> {
  $$ReposTableTableManager(_$AppDatabase db, $ReposTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReposTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReposTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReposTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String?> icon = const Value.absent(),
            Value<String> baseUrl = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<String> website = const Value.absent(),
            Value<String> signingKeyFingerprint = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReposCompanion(
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
              ReposCompanion.insert(
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

typedef $$ReposTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReposTable,
    Repo,
    $$ReposTableFilterComposer,
    $$ReposTableOrderingComposer,
    $$ReposTableAnnotationComposer,
    $$ReposTableCreateCompanionBuilder,
    $$ReposTableUpdateCompanionBuilder,
    (Repo, BaseReferences<_$AppDatabase, $ReposTable, Repo>),
    Repo,
    PrefetchHooks Function()>;
typedef $$InstalledExtensionsTableCreateCompanionBuilder
    = InstalledExtensionsCompanion Function({
  required String pkgName,
  required String displayName,
  required int version,
  required int pythonVersion,
  Value<String?> lang,
  required bool isNsfw,
  Value<int> rowid,
});
typedef $$InstalledExtensionsTableUpdateCompanionBuilder
    = InstalledExtensionsCompanion Function({
  Value<String> pkgName,
  Value<String> displayName,
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
  ColumnFilters<String> get pkgName => $composableBuilder(
      column: $table.pkgName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

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
  ColumnOrderings<String> get pkgName => $composableBuilder(
      column: $table.pkgName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

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
  GeneratedColumn<String> get pkgName =>
      $composableBuilder(column: $table.pkgName, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

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
            Value<String> pkgName = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<int> pythonVersion = const Value.absent(),
            Value<String?> lang = const Value.absent(),
            Value<bool> isNsfw = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InstalledExtensionsCompanion(
            pkgName: pkgName,
            displayName: displayName,
            version: version,
            pythonVersion: pythonVersion,
            lang: lang,
            isNsfw: isNsfw,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pkgName,
            required String displayName,
            required int version,
            required int pythonVersion,
            Value<String?> lang = const Value.absent(),
            required bool isNsfw,
            Value<int> rowid = const Value.absent(),
          }) =>
              InstalledExtensionsCompanion.insert(
            pkgName: pkgName,
            displayName: displayName,
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
typedef $$CollectionsTableCreateCompanionBuilder = CollectionsCompanion
    Function({
  required String id,
  required String name,
  Value<int> sortOrder,
  Value<int> rowid,
});
typedef $$CollectionsTableUpdateCompanionBuilder = CollectionsCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<int> sortOrder,
  Value<int> rowid,
});

final class $$CollectionsTableReferences
    extends BaseReferences<_$AppDatabase, $CollectionsTable, Collection> {
  $$CollectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CollectionBoardRefsTable,
      List<CollectionBoardRef>> _collectionBoardRefsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.collectionBoardRefs,
          aliasName: $_aliasNameGenerator(
              db.collections.id, db.collectionBoardRefs.collectionId));

  $$CollectionBoardRefsTableProcessedTableManager get collectionBoardRefsRefs {
    final manager = $$CollectionBoardRefsTableTableManager(
            $_db, $_db.collectionBoardRefs)
        .filter(
            (f) => f.collectionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_collectionBoardRefsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CollectionsTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));

  Expression<bool> collectionBoardRefsRefs(
      Expression<bool> Function($$CollectionBoardRefsTableFilterComposer f) f) {
    final $$CollectionBoardRefsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.collectionBoardRefs,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionBoardRefsTableFilterComposer(
              $db: $db,
              $table: $db.collectionBoardRefs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CollectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));
}

class $$CollectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  Expression<T> collectionBoardRefsRefs<T extends Object>(
      Expression<T> Function($$CollectionBoardRefsTableAnnotationComposer a)
          f) {
    final $$CollectionBoardRefsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.collectionBoardRefs,
            getReferencedColumn: (t) => t.collectionId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CollectionBoardRefsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.collectionBoardRefs,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CollectionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CollectionsTable,
    Collection,
    $$CollectionsTableFilterComposer,
    $$CollectionsTableOrderingComposer,
    $$CollectionsTableAnnotationComposer,
    $$CollectionsTableCreateCompanionBuilder,
    $$CollectionsTableUpdateCompanionBuilder,
    (Collection, $$CollectionsTableReferences),
    Collection,
    PrefetchHooks Function({bool collectionBoardRefsRefs})> {
  $$CollectionsTableTableManager(_$AppDatabase db, $CollectionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CollectionsCompanion(
            id: id,
            name: name,
            sortOrder: sortOrder,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<int> sortOrder = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CollectionsCompanion.insert(
            id: id,
            name: name,
            sortOrder: sortOrder,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CollectionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({collectionBoardRefsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionBoardRefsRefs) db.collectionBoardRefs
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionBoardRefsRefs)
                    await $_getPrefetchedData<Collection, $CollectionsTable, CollectionBoardRef>(
                        currentTable: table,
                        referencedTable: $$CollectionsTableReferences
                            ._collectionBoardRefsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CollectionsTableReferences(db, table, p0)
                                .collectionBoardRefsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.collectionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CollectionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CollectionsTable,
    Collection,
    $$CollectionsTableFilterComposer,
    $$CollectionsTableOrderingComposer,
    $$CollectionsTableAnnotationComposer,
    $$CollectionsTableCreateCompanionBuilder,
    $$CollectionsTableUpdateCompanionBuilder,
    (Collection, $$CollectionsTableReferences),
    Collection,
    PrefetchHooks Function({bool collectionBoardRefsRefs})>;
typedef $$CollectionBoardRefsTableCreateCompanionBuilder
    = CollectionBoardRefsCompanion Function({
  required String collectionId,
  required String extensionPkgName,
  required String siteId,
  required String boardId,
  Value<String> boardName,
  Value<int> rowid,
});
typedef $$CollectionBoardRefsTableUpdateCompanionBuilder
    = CollectionBoardRefsCompanion Function({
  Value<String> collectionId,
  Value<String> extensionPkgName,
  Value<String> siteId,
  Value<String> boardId,
  Value<String> boardName,
  Value<int> rowid,
});

final class $$CollectionBoardRefsTableReferences extends BaseReferences<
    _$AppDatabase, $CollectionBoardRefsTable, CollectionBoardRef> {
  $$CollectionBoardRefsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CollectionsTable _collectionIdTable(_$AppDatabase db) =>
      db.collections.createAlias($_aliasNameGenerator(
          db.collectionBoardRefs.collectionId, db.collections.id));

  $$CollectionsTableProcessedTableManager get collectionId {
    final $_column = $_itemColumn<String>('collection_id')!;

    final manager = $$CollectionsTableTableManager($_db, $_db.collections)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CollectionBoardRefsTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionBoardRefsTable> {
  $$CollectionBoardRefsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get extensionPkgName => $composableBuilder(
      column: $table.extensionPkgName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteId => $composableBuilder(
      column: $table.siteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get boardId => $composableBuilder(
      column: $table.boardId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get boardName => $composableBuilder(
      column: $table.boardName, builder: (column) => ColumnFilters(column));

  $$CollectionsTableFilterComposer get collectionId {
    final $$CollectionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableFilterComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionBoardRefsTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionBoardRefsTable> {
  $$CollectionBoardRefsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get extensionPkgName => $composableBuilder(
      column: $table.extensionPkgName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteId => $composableBuilder(
      column: $table.siteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get boardId => $composableBuilder(
      column: $table.boardId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get boardName => $composableBuilder(
      column: $table.boardName, builder: (column) => ColumnOrderings(column));

  $$CollectionsTableOrderingComposer get collectionId {
    final $$CollectionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableOrderingComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionBoardRefsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionBoardRefsTable> {
  $$CollectionBoardRefsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get extensionPkgName => $composableBuilder(
      column: $table.extensionPkgName, builder: (column) => column);

  GeneratedColumn<String> get siteId =>
      $composableBuilder(column: $table.siteId, builder: (column) => column);

  GeneratedColumn<String> get boardId =>
      $composableBuilder(column: $table.boardId, builder: (column) => column);

  GeneratedColumn<String> get boardName =>
      $composableBuilder(column: $table.boardName, builder: (column) => column);

  $$CollectionsTableAnnotationComposer get collectionId {
    final $$CollectionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionsTableAnnotationComposer(
              $db: $db,
              $table: $db.collections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionBoardRefsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CollectionBoardRefsTable,
    CollectionBoardRef,
    $$CollectionBoardRefsTableFilterComposer,
    $$CollectionBoardRefsTableOrderingComposer,
    $$CollectionBoardRefsTableAnnotationComposer,
    $$CollectionBoardRefsTableCreateCompanionBuilder,
    $$CollectionBoardRefsTableUpdateCompanionBuilder,
    (CollectionBoardRef, $$CollectionBoardRefsTableReferences),
    CollectionBoardRef,
    PrefetchHooks Function({bool collectionId})> {
  $$CollectionBoardRefsTableTableManager(
      _$AppDatabase db, $CollectionBoardRefsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionBoardRefsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionBoardRefsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionBoardRefsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> collectionId = const Value.absent(),
            Value<String> extensionPkgName = const Value.absent(),
            Value<String> siteId = const Value.absent(),
            Value<String> boardId = const Value.absent(),
            Value<String> boardName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CollectionBoardRefsCompanion(
            collectionId: collectionId,
            extensionPkgName: extensionPkgName,
            siteId: siteId,
            boardId: boardId,
            boardName: boardName,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String collectionId,
            required String extensionPkgName,
            required String siteId,
            required String boardId,
            Value<String> boardName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CollectionBoardRefsCompanion.insert(
            collectionId: collectionId,
            extensionPkgName: extensionPkgName,
            siteId: siteId,
            boardId: boardId,
            boardName: boardName,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CollectionBoardRefsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({collectionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (collectionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.collectionId,
                    referencedTable: $$CollectionBoardRefsTableReferences
                        ._collectionIdTable(db),
                    referencedColumn: $$CollectionBoardRefsTableReferences
                        ._collectionIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CollectionBoardRefsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CollectionBoardRefsTable,
    CollectionBoardRef,
    $$CollectionBoardRefsTableFilterComposer,
    $$CollectionBoardRefsTableOrderingComposer,
    $$CollectionBoardRefsTableAnnotationComposer,
    $$CollectionBoardRefsTableCreateCompanionBuilder,
    $$CollectionBoardRefsTableUpdateCompanionBuilder,
    (CollectionBoardRef, $$CollectionBoardRefsTableReferences),
    CollectionBoardRef,
    PrefetchHooks Function({bool collectionId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ReposTableTableManager get repos =>
      $$ReposTableTableManager(_db, _db.repos);
  $$InstalledExtensionsTableTableManager get installedExtensions =>
      $$InstalledExtensionsTableTableManager(_db, _db.installedExtensions);
  $$SuggestionsTableTableManager get suggestions =>
      $$SuggestionsTableTableManager(_db, _db.suggestions);
  $$CollectionsTableTableManager get collections =>
      $$CollectionsTableTableManager(_db, _db.collections);
  $$CollectionBoardRefsTableTableManager get collectionBoardRefs =>
      $$CollectionBoardRefsTableTableManager(_db, _db.collectionBoardRefs);
}
