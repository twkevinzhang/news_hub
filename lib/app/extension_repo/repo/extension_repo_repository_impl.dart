import 'package:news_hub/domain/extension_repo/model/index.dart';
import 'package:news_hub/domain/extension_repo/repo/extension_repo_repository.dart';
import 'package:sqflite/sqflite.dart';

class ExtensionRepoRepositoryImpl implements ExtensionRepoRepository {
  final Database _db;

  ExtensionRepoRepositoryImpl({
    required Database db,
  }): _db = db;

  @override
  Future<void> insertRepo({
    required String baseUrl,
    required String name,
    required String website,
    required String signingKeyFingerprint,
  }) async {
    await _db.insert(
      'extension_repo',
      {
        'baseUrl': baseUrl,
        'name': name,
        'website': website,
        'signingKeyFingerprint': signingKeyFingerprint,
      },
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  @override
  Future<void> deleteRepo(String baseUrl) async {
    await _db.delete(
      'extension_repo',
      where: 'baseUrl = ?',
      whereArgs: [baseUrl],
    );
  }

  @override
  Future<List<ExtensionRepo>> getAll() async {
    final List<Map<String, dynamic>> maps = await _db.query('extension_repo');
    return List.generate(maps.length, (i) {
      return ExtensionRepo(
        baseUrl: maps[i]['baseUrl'],
        name: maps[i]['name'],
        website: maps[i]['website'],
        signingKeyFingerprint: maps[i]['signingKeyFingerprint'],
      );
    });
  }

  @override
  Stream<int> getCount() async* {
    while (true) {
      final count = Sqflite.firstIntValue(
        await _db.rawQuery('SELECT COUNT(*) FROM extension_repo'),
      );
      yield count ?? 0;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Future<ExtensionRepo?> getRepo(String baseUrl) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'extension_repo',
      where: 'baseUrl = ?',
      whereArgs: [baseUrl],
    );
    if (maps.isNotEmpty) {
      return ExtensionRepo(
        baseUrl: maps[0]['baseUrl'],
        name: maps[0]['name'],
        website: maps[0]['website'],
        signingKeyFingerprint: maps[0]['signingKeyFingerprint'],
      );
    }
    return null;
  }

  @override
  Future<ExtensionRepo?> getRepoBySigningKeyFingerprint(String fingerprint) async {
    final List<Map<String, dynamic>> maps = await _db.query(
      'extension_repo',
      where: 'signingKeyFingerprint = ?',
      whereArgs: [fingerprint],
    );
    if (maps.isNotEmpty) {
      return ExtensionRepo(
        baseUrl: maps[0]['baseUrl'],
        name: maps[0]['name'],
        website: maps[0]['website'],
        signingKeyFingerprint: maps[0]['signingKeyFingerprint'],
      );
    }
    return null;
  }

  @override
  Future<void> replaceRepo(ExtensionRepo newRepo) async {
    await _db.update(
      'extension_repo',
      {
        'name': newRepo.name,
        'website': newRepo.website,
        'signingKeyFingerprint': newRepo.signingKeyFingerprint,
      },
      where: 'baseUrl = ?',
      whereArgs: [newRepo.baseUrl],
    );
  }

  @override
  Stream<List<ExtensionRepo>> subscribeAll() async* {
    while (true) {
      final repos = await getAll();
      yield repos;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Future<void> upsertRepo({
    required String baseUrl,
    required String name,
    required String website,
    required String signingKeyFingerprint,
  }) async {
    await _db.insert(
      'extension_repo',
      {
        'baseUrl': baseUrl,
        'name': name,
        'website': website,
        'signingKeyFingerprint': signingKeyFingerprint,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> upsertRepoWithObject(ExtensionRepo repo) async {
    await _db.insert(
      'extension_repo',
      {
        'baseUrl': repo.baseUrl,
        'name': repo.name,
        'website': repo.website,
        'signingKeyFingerprint': repo.signingKeyFingerprint,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
