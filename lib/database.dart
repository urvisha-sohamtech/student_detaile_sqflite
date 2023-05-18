import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Future<Database> db(){
    return openDatabase(
      'flutter.db',
      version: 1,
      onCreate: (Database database, int version) {
         createTable(database);
      },
    );
  }

  static Future<void> createTable(Database database) async {
    await database.execute(""" CREATE TABLE items(
        id INTEGER PRIMARY KEY,
        name TEXT,
        dob TEXT,
        email TEXT,
        mobile INTEGER,
        // createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        )
        """);
  }

  static Future<int> createItem(String?id, String?name, String?dob, String?email, String?moblie)async{
    final db = await DatabaseHelper.db();
    final data = {'id':id, 'name':name, 'dob':dob, 'email': email, 'mobile': moblie};
    final idno =  db.insert('items', data,
     conflictAlgorithm: ConflictAlgorithm.replace);
    return idno;
  }

   static Future<List<Map<String,dynamic>>> getItems() async{
    final db  = await DatabaseHelper.db();
    return db.query('items',orderBy: "id");
   }

  static Future<List<Map<String,dynamic>>> getItem(int id) async{
    final db = await DatabaseHelper.db();
    return db.query('items',where: "id = ?",whereArgs: [id],limit: 1);
  }

  static Future<int> updateItem(
      String id,String name, String dob, String email, String mobile,)async{
    final db = await DatabaseHelper.db();
    final data = {
      'id': id,
      'name': name,
      'dob': dob,
      'email':email,
      'mobile': mobile,
    };
    final result= await db.update('items', data,where: "id =?",whereArgs: [id]);
    return result;
  }
}