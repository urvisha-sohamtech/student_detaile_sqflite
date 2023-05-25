import 'package:flutter/material.dart';

class Student extends StatelessWidget {
Student({required this.id,required this.name,required this.dob,required this.email,required this.mobile});
   final String id;
  final String name;
  final String dob;
  final String email;
  final String mobile;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.white,
        height: 150,
        width: double.infinity,
        padding: EdgeInsets.only(top: 10,bottom:10,left: 20,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$id',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              '$name',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              '$dob',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              '$email',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              '$mobile',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
