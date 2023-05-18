// import 'package:flutter/material.dart';
// import 'package:student_detaile_sqflite/add%20student.dart';
//
// class List extends StatelessWidget {
// List({required this.id,required this.Name,required this.Dob,required this.Email,required this.Mobile});
//   final String id;
//   final String Name;
//   final String Dob;
//   final String Email;
//   final String Mobile;
//
//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: UniqueKey(),
//       background: Container(
//         child: IconButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> AddStudent()));},
//             icon: Icon(Icons.edit))
//       ),
//       secondaryBackground: Icon(Icons.delete),
//       child: Card(
//         child: Container(
//           color: Colors.white,
//           height: 150,
//           width: double.infinity,
//           padding: EdgeInsets.only(top: 10,bottom:10,left: 20,right: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '$id',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 '$Name',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 '$Dob',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 '$Email',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 '$Mobile',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
