import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/app/service/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:injectable/injectable.dart';

@dev
@LazySingleton(as: ExtensionRepoRepository)
class ExtensionRepoRepositoryImpl implements ExtensionRepoRepository {
  final DatabaseService _service;

  ExtensionRepoRepositoryImpl({
    required DatabaseService service,
  }): _service = service;

  @override
  Future<void> insertRepo({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  }) async {
    final db = await _service.database();
    await db.insert(
      'extension_repo',
      {
        'baseUrl': baseUrl,
        'displayName': displayName,
        'website': website,
        'signingKeyFingerprint': signingKeyFingerprint,
      },
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  @override
  Future<void> deleteRepo(String baseUrl) async {
    final db = await _service.database();
    await db.delete(
      'extension_repo',
      where: 'baseUrl = ?',
      whereArgs: [baseUrl],
    );
  }

  @override
  Future<List<ExtensionRepo>> getAll() async {
    final db = await _service.database();
    final List<Map<String, dynamic>> maps = await db.query('extension_repo');
    return List.generate(maps.length, (i) {
      return ExtensionRepo(
        icon: maps[i]['icon'],
        baseUrl: maps[i]['baseUrl'],
        displayName: maps[i]['displayName'],
        website: maps[i]['website'],
        signingKeyFingerprint: maps[i]['signingKeyFingerprint'],
      );
    });
  }

  @override
  Stream<int> getCount() async* {
    final db = await _service.database();
    while (true) {
      final count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM extension_repo'),
      );
      yield count ?? 0;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Future<ExtensionRepo> getRepo(String baseUrl) async {
    final db = await _service.database();
    final List<Map<String, dynamic>> maps = await db.query(
      'extension_repo',
      where: 'baseUrl = ?',
      whereArgs: [baseUrl],
    );
    if (maps.isNotEmpty) {
      return ExtensionRepo(
        icon: maps[0]['icon'],
        baseUrl: maps[0]['baseUrl'],
        displayName: maps[0]['displayName'],
        website: maps[0]['website'],
        signingKeyFingerprint: maps[0]['signingKeyFingerprint'],
      );
    }
    throw Exception('No repo found for $baseUrl');
  }

  @override
  Future<ExtensionRepo> getRepoBySigningKeyFingerprint(String fingerprint) async {
    final db = await _service.database();
    final List<Map<String, dynamic>> maps = await db.query(
      'extension_repo',
      where: 'signingKeyFingerprint = ?',
      whereArgs: [fingerprint],
    );
    if (maps.isNotEmpty) {
      return ExtensionRepo(
        icon: maps[0]['icon'],
        baseUrl: maps[0]['baseUrl'],
        displayName: maps[0]['displayName'],
        website: maps[0]['website'],
        signingKeyFingerprint: maps[0]['signingKeyFingerprint'],
      );
    }
    throw Exception('No repo found for $fingerprint');
  }

  @override
  Future<void> replaceRepo(ExtensionRepo newRepo) async {
    final db = await _service.database();
    await db.update(
      'extension_repo',
      {
        'displayName': newRepo.displayName,
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
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  }) async {
    final db = await _service.database();
    await db.insert(
      'extension_repo',
      {
        'baseUrl': baseUrl,
        'displayName': displayName,
        'website': website,
        'signingKeyFingerprint': signingKeyFingerprint,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> upsertRepoWithObject(ExtensionRepo repo) async {
    final db = await _service.database();
    await db.insert(
      'extension_repo',
      {
        'baseUrl': repo.baseUrl,
        'displayName': repo.displayName,
        'website': repo.website,
        'signingKeyFingerprint': repo.signingKeyFingerprint,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
