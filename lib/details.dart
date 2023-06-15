import 'package:flutter/material.dart';
import 'package:student_detaile_sqflite/student%20list.dart';

class Detail extends StatelessWidget {
  final Student student;
  Detail({required this.student});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Student Details'),
          backgroundColor: Colors.black45,
          centerTitle: true,
          leading:
            IconButton(
                onPressed: () {Navigator.pop(context);},
                icon: Icon(Icons.arrow_back))
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('id',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text(student.id.toString()),
                Padding(padding: EdgeInsets.all(5),
                ),
                const Text('name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text(student.name),
                Padding(padding: EdgeInsets.all(5),
                ),
                const Text('dob',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text(student.dob),
                Padding(padding: EdgeInsets.all(5),
                ),
                const Text('email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text(student.email),
                Padding(padding: EdgeInsets.all(5),
                ),
                const Text('mobile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5),
                ),
                Text(student.mobile),
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
