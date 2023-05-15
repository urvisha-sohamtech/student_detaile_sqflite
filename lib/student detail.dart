import 'package:flutter/material.dart';
import 'package:student_detaile_sqflite/student list.dart';
class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add student'),
      backgroundColor: Colors.black54,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          List(id: '1',Name: 'urvisha',Dob: '12/3/2003',Email: 'hfhej',Mobile: '236543634'),
          List(id: '2',Name: 'vdfdv',Dob: '2/5/2003',Email: 'j@gmail.com',Mobile: '236543634'),
          List(id: '3',Name: 'dsc',Dob: '17/3/1003',Email: 'njb@gamil.com',Mobile: '236543634'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            List(id: '1',Name: 'urvisha',Dob: '12/3/2003',Email: 'hfhej',Mobile: '236543634');
          });
        },
        child: Icon(Icons.add,),backgroundColor: Colors.black,
      ),
    );
  }
}
