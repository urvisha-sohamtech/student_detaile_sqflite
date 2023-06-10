import 'package:flutter/material.dart';
import 'package:student_detaile_sqflite/student%20list.dart';

class StudentDetails extends StatefulWidget {
  Student student;
  StudentDetails({Key? key,required this.student}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Student Details'),
          backgroundColor: Colors.black45,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('id',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                ),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text(widget.student.id),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text('name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text(widget.student.name),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text('dob',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text(widget.student.dob),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text('email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text(widget.student.email),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text('mobile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text(widget.student.mobile),
                Padding(padding: EdgeInsets.all(5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
