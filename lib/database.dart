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

  static Future<void> createTable(database) async {
     database.execute(""" CREATE TABLE items(
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        dob TEXT NOT NULL,
        email TEXT NOT NULL,
        mobile INTEGER NOT NULL,)
        """);
  }

  static Future<int> createItem(id, name, dob, email, mobile )async{
    final db = await DatabaseHelper.db();
    final data ={'id': id,'name': name,'dob': dob,'email': email,'mobile':mobile};
    final result =  db.insert('items',data);
    return result;
  }

  static Future<int> updateItem( id,name,dob,email,mobile)async{
    final db = await DatabaseHelper.db();
    final data = {'id': id,'name': name,'dob': dob,'email':email,'mobile': mobile,};
    final result= db.update('items', data);
    return result;
  }
}