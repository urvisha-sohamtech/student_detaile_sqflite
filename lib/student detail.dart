import 'package:flutter/material.dart';
import 'package:student_detaile_sqflite/add%20student.dart';

class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var myData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student detail'),
      backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body:myData.isEmpty? Center(child: Text(''),)
          : ListView.builder(
          itemCount: myData.length,
          itemBuilder: (context,index){
            return Dismissible(
             key: UniqueKey(),
             background: Icon(Icons.edit),
             secondaryBackground: Icon(Icons.delete),
              child: Card(
               color: Colors.lightBlue,
                margin: EdgeInsets.all(15),
                child: ListTile(
                title: Text(myData[index]['id''name''dob''email''mobile'],)
          ),
        ),
      );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>AddStudent()));
        },
        child: Icon(Icons.add,),backgroundColor: Colors.black,
      ),
    );
  }
}
