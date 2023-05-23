import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sql.dart';

class DatabaseHelper {

  static Future<sql.Database> db(){
    return sql.openDatabase(
      'flutter.db',
      version: 1,
      onCreate: (sql.Database database, int version) {
         createTable(database);
      },
    );
  }

  static Future<void> createTable(database) async {
    await database.execute(" CREATE TABLE items("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "dob TEXT,"
        "email TEXT,"
        "mobile INTEGER,)"
        );
  }

  static Future<int> createItem( id, name, dob, email, mobile)async{
    final db = await DatabaseHelper.db();
    final data = {'id':id, 'name':name, 'dob':dob, 'email': email, 'mobile': mobile};
    final result =  db.insert('items', data);
    return result;
  }

  static Future<int> updateItem( id,name,dob,email,mobile)async{
    final db = await DatabaseHelper.db();
    final data = {'id': id,'name': name,'dob': dob,'email':email,'mobile': mobile,};
    final result= db.update('items', data);
    return result;
  }
}