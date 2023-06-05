import 'package:flutter/material.dart';
import 'database.dart';

class AddStudent extends StatefulWidget {

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController dobcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController mobilecontroller = TextEditingController();

  List<Map<String, dynamic>> myData = [];
  bool isLoading =false;

  // void refreshData() async{
  //   final data = await DatabaseHelper.getItems();
  //   setState(() {
  //     myData = data;
  //     isLoading = false;
  //   });
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   // refreshData();
  // }

  Future<void> addItem() async {
    try {
      await DatabaseHelper.insertItem(
          idcontroller.text,
          namecontroller.text,
          dobcontroller.text,
          emailcontroller.text,
          mobilecontroller.text);
      // refreshData();
    }catch( error){
      debugPrint('*** error');
    }
  }

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
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      primary: Colors.white,
                      textStyle: TextStyle(fontSize: 15)
                    ),
                    child: Text('Add Detail'),
                      onPressed: (){
                      setState(() {
                        try {
                          addItem();
                          DatabaseHelper.getItems();
                        }catch(error){
                          debugPrint('** error');
                        }
                      });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('New Student Add')));
                       },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





