
import 'package:flutter/material.dart';

class List extends StatelessWidget {
List({required this.id,required this.Name,required this.Dob,required this.Email,required this.Mobile});
  final String id;
  final String Name;
  final String Dob;
  final String Email;
  final String Mobile;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      // direction: DismissDirection.endToStart,
      background: Container(
        child: IconButton(onPressed:(){}, icon: Icon(Icons.edit))
      ),
      secondaryBackground: Container(
        child: Icon(Icons.delete),
      ),
      child: Card(
        child: Container(
          color: Colors.black87,
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
                  color: Colors.white
                ),
              ),
              Text(
                '$Name',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                '$Dob',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                '$Email',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                '$Mobile',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
