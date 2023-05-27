import 'package:flutter/material.dart';
import 'package:student_detaile_sqflite/add%20student.dart';

class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   final myData = [];
bool isLoading =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student detail'),
      backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body:isLoading
          ? Center(child: CircularProgressIndicator(),)
          : ListView.builder(
          itemCount: myData.length,
          itemBuilder: (context,index){
            return Card(
              color: Colors.lightBlue,
              margin: EdgeInsets.all(15),
              child: ListTile(
                  title: Text(myData[index]['id']),
                subtitle: Text(myData[index]['name']),
                textColor: Colors.black,
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
