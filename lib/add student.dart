import 'package:flutter/material.dart';
import 'package:student_detaile_sqflite/database.dart';

class AddStudent extends StatefulWidget {

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Student'),
        backgroundColor: Colors.black54,
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Add Details',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter ID',
                  labelText: 'ID',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Dob',
                  labelText: 'Dob',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter No',
                  labelText: 'Mobile no.',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      primary: Colors.white,
                      textStyle: TextStyle(fontSize: 15)
                    ),
                      onPressed: (){Navigator.pop(context);},
                      child: Text('Add Detail'),
                  ),
                ],
              )
            ],
          ),
        ),
      )

    );
  }
}
