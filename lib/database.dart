import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
class DatabaseHelper {

  static Future<Database> db() async {
    return openDatabase(
      'flutterjunction.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE items(
        idno TEXT ,
        name TEXT,
        dob TEXT,
        email TEXT,
        mobile TEXT,
      )
      """);
  }
// id: the id of a item
// title, description: name and description of  activity
// created_at: the time that the item was created. It will be automatically handled by SQLite
  // Create new item
  static Future<int> createItem(String?idno, String?name, String?dob,String?email,String?mobile) async {
    final db = await DatabaseHelper.db();

    final data = {'idno': idno, 'name': name,'dob':dob, 'email': email, 'mobile': mobile};
    final id = await db.insert('items', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;

    // When a UNIQUE constraint violation occurs,
    // the pre-existing rows that are causing the constraint violation
    // are removed prior to inserting or updating the current row.
    // Thus the insert or update always occurs.
  }

  // Read all items
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseHelper.db();
    return db.query('items', orderBy: "id");
  }

  // Get a single item by id
  //We dont use this method, it is for you if you want it.
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DatabaseHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String name, String? dob, String email, String mobile) async {
    final db = await DatabaseHelper.db();

    final data = {
      'id': id,
      'name': name,
      'dob': dob,
      'email': email,
      'mobile': mobile,
    };

    final result =
    await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await DatabaseHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}