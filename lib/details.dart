import 'package:flutter/material.dart';
import 'package:student_detaile_sqflite/student%20list.dart';

class StudentDetails extends StatefulWidget {

  StudentDetails({Key? key,required this.student}) : super(key: key);
  final Student student;
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
                const Text('id',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                ),
                const Padding(padding: EdgeInsets.all(5),
                ),
                Text(widget.student.id),
                const Padding(padding: EdgeInsets.all(5),
                ),
                const Text('name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5),
                ),
                Text(widget.student.name),
                const Padding(padding: EdgeInsets.all(5),
                ),
                const Text('dob',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5),
                ),
                Text(widget.student.dob),
                const Padding(padding: EdgeInsets.all(5),
                ),
                const Text('email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5),
                ),
                Text(widget.student.email),
                const Padding(padding: EdgeInsets.all(5),
                ),
                const Text('mobile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5),
                ),
                Text(widget.student.mobile),
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

// class Detail extends StatelessWidget {
//   final Student student;
//   Detail({required this.student});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Student Details'),
//           backgroundColor: Colors.black45,
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(10),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('id',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//                 Padding(padding: EdgeInsets.all(5),
//                 ),
//                 Text(student.id),
//                 Padding(padding: EdgeInsets.all(5),
//                 ),
//                 Text('name',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//                 Padding(padding: EdgeInsets.all(5),
//                 ),
//                 Text(student.name),
//                 Padding(padding: EdgeInsets.all(5),
//                 ),
//                 Text('dob',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//                 Padding(padding: EdgeInsets.all(5),
//                 ),
//                 Text(student.dob),
//                 Padding(padding: EdgeInsets.all(5),
//                 ),
//                 Text('email',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//                 Padding(padding: EdgeInsets.all(5),
//                 ),
//                 Text(student.email),
//                 Padding(padding: EdgeInsets.all(5),
//                 ),
//                 Text('mobile',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//                 Padding(padding: EdgeInsets.all(5),
//                 ),
//                 Text(student.mobile),
//                 Padding(padding: EdgeInsets.all(5),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
