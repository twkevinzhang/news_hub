// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
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
      [collectionId, extensionPkgName, boardId, boardName];
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
      {collectionId, extensionPkgName, boardId};
  @override
  CollectionBoardRef map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionBoardRef(
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      extensionPkgName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}extension_pkg_name'])!,
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
  final String boardId;
  final String boardName;
  const CollectionBoardRef(
      {required this.collectionId,
      required this.extensionPkgName,
      required this.boardId,
      required this.boardName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['collection_id'] = Variable<String>(collectionId);
    map['extension_pkg_name'] = Variable<String>(extensionPkgName);
    map['board_id'] = Variable<String>(boardId);
    map['board_name'] = Variable<String>(boardName);
    return map;
  }

  CollectionBoardRefsCompanion toCompanion(bool nullToAbsent) {
    return CollectionBoardRefsCompanion(
      collectionId: Value(collectionId),
      extensionPkgName: Value(extensionPkgName),
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
      'boardId': serializer.toJson<String>(boardId),
      'boardName': serializer.toJson<String>(boardName),
    };
  }

  CollectionBoardRef copyWith(
          {String? collectionId,
          String? extensionPkgName,
          String? boardId,
          String? boardName}) =>
      CollectionBoardRef(
        collectionId: collectionId ?? this.collectionId,
        extensionPkgName: extensionPkgName ?? this.extensionPkgName,
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
      boardId: data.boardId.present ? data.boardId.value : this.boardId,
      boardName: data.boardName.present ? data.boardName.value : this.boardName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionBoardRef(')
          ..write('collectionId: $collectionId, ')
          ..write('extensionPkgName: $extensionPkgName, ')
          ..write('boardId: $boardId, ')
          ..write('boardName: $boardName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(collectionId, extensionPkgName, boardId, boardName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionBoardRef &&
          other.collectionId == this.collectionId &&
          other.extensionPkgName == this.extensionPkgName &&
          other.boardId == this.boardId &&
          other.boardName == this.boardName);
}

class CollectionBoardRefsCompanion extends UpdateCompanion<CollectionBoardRef> {
  final Value<String> collectionId;
  final Value<String> extensionPkgName;
  final Value<String> boardId;
  final Value<String> boardName;
  final Value<int> rowid;
  const CollectionBoardRefsCompanion({
    this.collectionId = const Value.absent(),
    this.extensionPkgName = const Value.absent(),
    this.boardId = const Value.absent(),
    this.boardName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollectionBoardRefsCompanion.insert({
    required String collectionId,
    required String extensionPkgName,
    required String boardId,
    this.boardName = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : collectionId = Value(collectionId),
        extensionPkgName = Value(extensionPkgName),
        boardId = Value(boardId);
  static Insertable<CollectionBoardRef> custom({
    Expression<String>? collectionId,
    Expression<String>? extensionPkgName,
    Expression<String>? boardId,
    Expression<String>? boardName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (collectionId != null) 'collection_id': collectionId,
      if (extensionPkgName != null) 'extension_pkg_name': extensionPkgName,
      if (boardId != null) 'board_id': boardId,
      if (boardName != null) 'board_name': boardName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollectionBoardRefsCompanion copyWith(
      {Value<String>? collectionId,
      Value<String>? extensionPkgName,
      Value<String>? boardId,
      Value<String>? boardName,
      Value<int>? rowid}) {
    return CollectionBoardRefsCompanion(
      collectionId: collectionId ?? this.collectionId,
      extensionPkgName: extensionPkgName ?? this.extensionPkgName,
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
  late final $SuggestionsTable suggestions = $SuggestionsTable(this);
  late final $CollectionsTable collections = $CollectionsTable(this);
  late final $CollectionBoardRefsTable collectionBoardRefs =
      $CollectionBoardRefsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [suggestions, collections, collectionBoardRefs];
}

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
  required String boardId,
  Value<String> boardName,
  Value<int> rowid,
});
typedef $$CollectionBoardRefsTableUpdateCompanionBuilder
    = CollectionBoardRefsCompanion Function({
  Value<String> collectionId,
  Value<String> extensionPkgName,
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
            Value<String> boardId = const Value.absent(),
            Value<String> boardName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CollectionBoardRefsCompanion(
            collectionId: collectionId,
            extensionPkgName: extensionPkgName,
            boardId: boardId,
            boardName: boardName,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String collectionId,
            required String extensionPkgName,
            required String boardId,
            Value<String> boardName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CollectionBoardRefsCompanion.insert(
            collectionId: collectionId,
            extensionPkgName: extensionPkgName,
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
  $$SuggestionsTableTableManager get suggestions =>
      $$SuggestionsTableTableManager(_db, _db.suggestions);
  $$CollectionsTableTableManager get collections =>
      $$CollectionsTableTableManager(_db, _db.collections);
  $$CollectionBoardRefsTableTableManager get collectionBoardRefs =>
      $$CollectionBoardRefsTableTableManager(_db, _db.collectionBoardRefs);
}
