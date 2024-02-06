import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      description TEXT,
      autor TEXT,
      photoLink TEXT, 
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");

    await _insertInitialData(database);
  }

  static Future<void> _insertInitialData(sql.Database database) async {
    final List<Map<String, dynamic>> initialData = [
      {
        'title': 'First Item',
        'description': 'Description of the first item',
        'autor': 'Author of the first item',
        'photoLink':
            'https://static.vecteezy.com/vite/assets/photo-masthead-375-b8ae1548.webp',
      },
      {
        'title': 'Second Item',
        'description': 'Description of the second item',
        'autor': 'Author of the second item',
        'photoLink':
            'https://static.vecteezy.com/vite/assets/photo-masthead-375-b8ae1548.webp',
      },
    ];

    for (final Map<String, dynamic> data in initialData) {
      await database.insert('items', data,
          conflictAlgorithm: sql.ConflictAlgorithm.replace);
    }
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbtech.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 0) {
          await db.execute('ALTER TABLE items ADD COLUMN photoLink TEXT');
        }
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String title, String? description,
      String? autor, String? photoLink) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': description,
      'autor': autor,
      'photoLink': photoLink,
    };

    try {
      final id = await db.insert('items', data,
          conflictAlgorithm: sql.ConflictAlgorithm.replace);
      print('Item added successfully with ID: $id');
      return id;
    } catch (e) {
      print('Error adding item: $e');
      return Future.error('Failed to add item: $e');
    }
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(int id, String title, String? descrption,
      String? autor, String? photoLink) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': descrption,
      'autor': autor,
      'photoLink': photoLink,
      'createdAt': DateTime.now().toString(),
    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
