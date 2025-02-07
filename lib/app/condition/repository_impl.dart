import 'dart:convert';

import 'package:dartx/src/map.dart';
import 'package:news_hub/app/models/models.dart';
import 'package:news_hub/app/service/database.dart';
import 'package:news_hub/domain/search_config/search_config.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: SearchConfigRepository)
class SearchConfigRepositoryImpl implements SearchConfigRepository {
  final DatabaseService _service;

  SearchConfigRepositoryImpl({
    required DatabaseService service,
  }) : _service = service;

  @override
  Future<void> insertRepo({
    required String id,
    required Set<Board> enabledBoards,
    required Set<Pair<Board, String>> threadsSorting,
    required String keywords,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> upsertRepo({
    required String id,
    required Set<Board> enabledBoards,
    required Set<Pair<Board, String>> threadsSorting,
    required String keywords,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRepo(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<SearchConfig>> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<SearchConfig?> getSearchConfig(String id) async {
    throw UnimplementedError();
  }

  @override
  Stream<int> getCount() async* {
    final db = await _service.database();
    while (true) {
      final count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM searchConfig'),
      );
      yield count ?? 0;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Stream<List<SearchConfig>> subscribeAll() async* {
    while (true) {
      final searchConfigs = await getAll();
      yield searchConfigs;
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}