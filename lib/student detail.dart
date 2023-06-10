import 'package:flutter/material.dart';
import 'package:student_detaile_sqflite/details.dart';
import 'package:student_detaile_sqflite/student%20list.dart';
import 'database.dart';

class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController dobcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController mobilecontroller = TextEditingController();
   List<Map<String, dynamic>> myData = [];
  bool _isLoading = true;

  void _refreshJournals() async {
    final data = await DatabaseHelper.getData();
    setState(() {
      myData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }
  Future<void> addItem() async {
    await DatabaseHelper.insert(
         idcontroller.text,
          namecontroller.text,
         dobcontroller.text,
         emailcontroller.text,
        mobilecontroller.text);
    _refreshJournals();
  }
  Future<void> updateItem()async{
    await DatabaseHelper.updateItem(
        idcontroller.text,
         namecontroller.text,
         dobcontroller.text,
        emailcontroller.text,
        mobilecontroller.text);
  }
   void showform(int? id) async{
     if(id != null){
       final existingdata =
       myData.firstWhere((element) => element['id']==id);
       idcontroller.text= existingdata['id'];
       namecontroller.text = existingdata['name'];
       dobcontroller.text =existingdata['dob'];
       emailcontroller.text = existingdata['email'];
       mobilecontroller.text = existingdata['mobile'];
     }

     showModalBottomSheet(
         context: context,
         elevation: 5,
         isScrollControlled: true,
         builder: (_) => Container(
           padding: EdgeInsets.only(top: 15,left: 15,bottom:MediaQuery.of(context).viewInsets.bottom+50,right: 15),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             // crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               const Text(
                 'Add Details',
                 style: TextStyle(
                   fontSize: 20,
                   color: Colors.black,
                   fontWeight: FontWeight.w500,
                 ),
               ),
               const SizedBox(
                 height: 20,
               ),
               TextField(
                 controller: idcontroller,
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Enter ID',
                   labelText: 'ID',
                 ),
               ),
               const SizedBox(
                 height: 10,
               ),
               TextField(
                 controller: namecontroller,
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Enter Name',
                   labelText: 'Name',
                 ),
               ),
               const SizedBox(
                 height: 10,
               ),
               TextField(
                 controller: dobcontroller,
                 decoration:const  InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Enter Dob',
                   labelText: 'Date Of Birth',
                 ),
               ),
               const SizedBox(
                 height: 10,
               ),
               TextField(
                 controller: emailcontroller,
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Enter Email',
                   labelText: 'Email',
                 ),
               ),
               const SizedBox(
                 height: 10,
               ),
               TextField(
                 controller: mobilecontroller,
                 decoration:const InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Enter No',
                   labelText: 'Mobile no.',
                 ),
               ),
               const SizedBox(
                 height: 20,
               ),
               Row(
                 // crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   TextButton(
                     style: TextButton.styleFrom(
                         backgroundColor: Colors.black,
                         primary: Colors.white,
                         textStyle: TextStyle(fontSize: 15)
                     ),
                     child: Text(id == null?'Add Detail': 'Update'),
                     onPressed: (){
                       addItem();
                       updateItem();
                       idcontroller.text='';
                       namecontroller.text='';
                       dobcontroller.text='';
                       emailcontroller.text='';
                       mobilecontroller.text='';
                       Navigator.pop(context);
                       ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text('New Student Add')));
                     },
                   ),
                 ],
               ),
             ],
           ),
         ),);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student detail'),
      backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body:ListView.builder(
          itemCount: myData.length,
          itemBuilder: (context, index){
            return Dismissible(
              key: UniqueKey(),
              background:Container(child: IconButton(onPressed: ()=>showform(myData[index]['name']), icon: Icon(Icons.edit))) ,
              secondaryBackground: Container(child: Icon(Icons.delete,)),
              child: Card(
                color: Colors.teal,
                margin: EdgeInsets.all(10),
                elevation: 7,
                child: ListTile(
                    title: Text(myData[index]['name'],style: TextStyle(fontSize: 20)),
                  subtitle: Text(myData[index]['dob']),
                  textColor: Colors.white,
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetails(student: Student(id: 'id', name: 'name', dob: 'dob', email: 'email', mobile: 'mobile'),)));
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showform(null),
        // {Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddStudent()));},
        child: Icon(Icons.add,),backgroundColor: Colors.black,
      ),
    );
  }
}

