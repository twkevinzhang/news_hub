import 'package:drift/drift.dart';
import 'package:news_hub/app/service/database/database.dart';
import 'package:news_hub/app/suggestion/repository/models/transform.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/suggestion/repository.dart';
import 'package:news_hub/shared/exceptions.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: SuggestionRepository)
class SuggestionRepositoryImpl implements SuggestionRepository {
  final AppDatabase _db;

  SuggestionRepositoryImpl({
    required AppDatabase db,
  }) : _db = db;

  @override
  Stream<int> count() {
    return _db.select(_db.suggestions).watch().map((l) => l.length);
  }

  @override
  Future<void> delete(String id) async {
    await (_db.delete(_db.suggestions)..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<void> insert({required String keywords}) async {
    final suggestion = SuggestionsCompanion.insert(
      id: const Uuid().v4(),
      keywords: keywords,
      latestUsedAt: DateTime.now(),
    );
    await _db.into(_db.suggestions).insert(suggestion);
  }

  @override
  Future<List<domain.Suggestion>> list() async {
    final suggestions = await _db.select(_db.suggestions).get();
    return suggestions.map((s) => s.toDomain()).toList();
  }

  @override
  Stream<List<domain.Suggestion>> watchList() {
    return _db.select(_db.suggestions).watch().map((l) => l.map((s) => s.toDomain()).toList());
  }

  @override
  Future<domain.Suggestion> upsert({required String keywords}) async {
    final suggestion = SuggestionsCompanion(
      id: Value(const Uuid().v4()),
      keywords: Value(keywords),
    );
    await _db.into(_db.suggestions).insertOnConflictUpdate(suggestion);
    return get(suggestion.id.value);
  }

  Future<domain.Suggestion> get(String id) async {
    final suggestion = await (_db.select(_db.suggestions)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if (suggestion == null) throw NotFoundException();
    return suggestion.toDomain();
  }

  @override
  Future<void> updateLatestUsedAt(String id) {
    return (_db.update(_db.suggestions)..where((tbl) => tbl.id.equals(id))).write(SuggestionsCompanion(
      latestUsedAt: Value(DateTime.now()),
    ));
  }
}
