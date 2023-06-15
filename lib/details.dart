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
                onPressed: () {
                  Navigator.pop(context);
                  },
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
                const Padding(padding: EdgeInsets.all(2),
                ),
                Text(student.id.toString()),
                const Padding(padding: EdgeInsets.all(5),
                ),
                const Text('name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(2),
                ),
                Text(student.name),
                const Padding(padding: EdgeInsets.all(5),
                ),
                const Text('dob',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(2),
                ),
                Text(student.dob),
                const Padding(padding: EdgeInsets.all(5),
                ),
                const Text('email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(2),
                ),
                Text(student.email),
                const Padding(padding: EdgeInsets.all(5),
                ),
                const Text('mobile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(2),
                ),
                Text(student.mobile),
                const Padding(padding: EdgeInsets.all(5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
