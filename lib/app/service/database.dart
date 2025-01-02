import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class DatabaseService {
  Future<Database> database() async {
    return openDatabase(
      'news_hub.db',
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE threads (
            id INTEGER PRIMARY KEY,
            title TEXT,
            url TEXT
          )
        ''');
      },
    );
  }
}
