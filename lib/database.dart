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
        stuid TEXT,
        name TEXT,
        dob TEXT,
        email TEXT,
        mobile INTEGER,
        )
        """);
  }

  static Future<int> createItem(
      String?stuid, String?name, String?dob, String?email, String?mobile)async{
    final db = await DatabaseHelper.db();
    final data = {'id':stuid, 'name':name, 'dob':dob, 'email': email, 'mobile': mobile};
    final id =  db.insert('items', data,
     conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

   static Future<List> getItems() async{
    final db  = await DatabaseHelper.db();
    return db.query('items');
   }

  static Future<List> getItem(int id) async{
    final db = await DatabaseHelper.db();
    return db.query('items',where: "id = ?",whereArgs: [id],limit: 1);
  }

  static Future<int> updateItem(
      String stuid,String name, String dob, String email, String mobile,)async{
    final db = await DatabaseHelper.db();
    final data = {
      'id': stuid,
      'name': name,
      'dob': dob,
      'email':email,
      'mobile': mobile,
    };
    final result= db.update('detail', data);
    return result;
  }
}