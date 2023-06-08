import 'package:flutter/widgets.dart';
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

  static Future<void> insert({required int id,required String  name,required String dob,required String email,required int mobile})async{
    try {
      final db = await DatabaseHelper.db();
      final data = {'id': id, 'name': name, 'dob': dob, 'email': email, 'mobile': mobile};
      db.insert('Student', data, conflictAlgorithm: ConflictAlgorithm.replace);
    }catch(error){
      print(error);
    }
  }

  static Future<List<Map<String,dynamic>>?> getData() async {
    try {
      final db = await DatabaseHelper.db();
      return db.query('Student');
    }catch(error){
      print(error);
    }
    return null ;
  }

  static Future<void> updateItem( {required int id,required String name,required String dob,required String email,required int mobile})async{
      final db = await DatabaseHelper.db();
      final data = {'id': id, 'name': name, 'dob': dob, 'email': email, 'mobile': mobile,};
      db.update('Student', data, where: "id = ?", whereArgs: [id]);
  }
}