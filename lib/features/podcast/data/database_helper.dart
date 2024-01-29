import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'my_database.db');
    return openDatabase(path, version: 11, onCreate: _createDatabase);
  }

  static Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS cards (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    image BLOB,
    name TEXT
    )
    ''');
  }

  static Future<int> insertCard(Uint8List img, String name) async {
    final db = await _openDatabase();
    final data = {
      'image': img,
      'name': name,
    };
    return await db.insert('cards', data);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await _openDatabase();
    return await db.query('cards');
  }
}
