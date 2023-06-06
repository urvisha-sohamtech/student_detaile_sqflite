import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static Future<Database> db(){
    try {
      debugPrint('1');
      return openDatabase(
        'flutter.db',
        version: 1,
        onCreate: (Database database, int version) {
          createTable(database);
        },
      );
    }catch(error){
      debugPrint('** error');
      return db();
    }
  }

  static Future<void> createTable(database) async {
    try {
      debugPrint('2');
      database.execute("""CREATE TABLE Student(
        id INTEGER PRIMARY KEY,
        name TEXT,
        dob TEXT,
        email TEXT,
        mobile INTEGER 
        )
        """);
    }catch(error){
      debugPrint('** error');
    }
    }

  static Future<int> insertItem(id, name, dob, email, mobile )async{
    try {
      debugPrint('3');
      final db = await DatabaseHelper.db();
      final data = {'id': id, 'name': name, 'dob': dob, 'email': email, 'mobile': mobile};
      final result = db.insert('Student', data, conflictAlgorithm: ConflictAlgorithm.replace);
      return result;
    }catch(error){
      debugPrint('** error');
      return 0;
    }
  }

  static Future<Object> getItems() async{
    try {
      debugPrint('4');
      final db = await DatabaseHelper.db();
      return db.query('Student');
    }catch(error){
      debugPrint('** error');
      return 0;
    }
  }

  static Future<int> updateItem( id,name,dob,email,mobile)async{
    try {
      final db = await DatabaseHelper.db();
      final data = {'id': id, 'name': name, 'dob': dob, 'email': email, 'mobile': mobile,};
      final result = db.update('Student', data, where: "id = ?", whereArgs: [id]);
      return result;
    }catch(error){
      debugPrint('** error');
      return 0;
    }
  }
}