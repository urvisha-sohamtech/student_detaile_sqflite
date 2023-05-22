import 'package:sqflite/sqflite.dart' ;
// import 'package:sqflite/sql.dart';

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
    await database.execute(""" CREATE TABLE items("
        id INTEGER PRIMARY KEY,
        name TEXT,
        dob TEXT,
        email TEXT,
        mobile INTEGER,
        " )
        """);
  }

  static Future<int> createItem( id, name, dob, email, mobile)async{
    final db = await DatabaseHelper.db();
    final data = {'id':id, 'name':name, 'dob':dob, 'email': email, 'mobile': mobile};
    final result =  db.insert('items', data);
    return result;
  }

  //  static Future<List> getItems() async{
  //   final db  = await DatabaseHelper.db();
  //   return db.query('items');
  //  }
  //
  // static Future<List> getItem(int id) async{
  //   final db = await DatabaseHelper.db();
  //   return db.query('items',where: "id = ?",whereArgs: [id],limit: 1);
  // }

  static Future<int> updateItem( id,name,dob,email,mobile)async{
    final db = await DatabaseHelper.db();
    final data = {'id': id,'name': name,'dob': dob,'email':email,'mobile': mobile,};
    final result= db.update('items', data,where: "id = ?", whereArgs: [id]);
    return result;
  }
}