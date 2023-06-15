import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static Future<Database> db()async{
      // var dbpath = getDatabasesPath();
      // debugPrint(dbpath.toString());
      return openDatabase(
        'flutter.db',
        version: 1,
        onCreate: (database, version) {
          createTable(database);
        },
      );
  }
  // debugPrint('====> ERROR : ${error.toString()}');

  static Future<void> createTable(database) async {
      database.execute("""CREATE TABLE Student(
        id INTEGER PRIMARY KEY,
        name TEXT,
        dob TEXT,
        email TEXT,
        mobile INTEGER 
        ) 
        """);
    }

  static Future<void> insert( id,name, dob, email, mobile)async{
      final db = await DatabaseHelper.db();
      final data = {'id': id, 'name': name, 'dob': dob, 'email': email, 'mobile': mobile};
      db.insert('Student', data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String,dynamic>>> getData() async {
      final db = await DatabaseHelper.db();
      return db.query('Student');
  }

  static Future<void> updateItem( id, name, dob,email, mobile)async{
      final db = await DatabaseHelper.db();
      final data = {'id': id, 'name': name, 'dob': dob, 'email': email, 'mobile': mobile,};
      db.update('Student', data, where: "id = ?", whereArgs: [id]);
  }

  static Future<void> deleteItem(int id) async{
    final db = await DatabaseHelper.db();
    db.delete('Student',where: "id = ?" , whereArgs: [id]);
  }
}