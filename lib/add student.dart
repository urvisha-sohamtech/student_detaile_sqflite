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

  final formKey = GlobalKey<FormState>();
  String? formValidator(String value) {
    if (value.isEmpty) return 'Field is Required';
    return null;
  }

  Future<void> addItem() async {
    DatabaseHelper.createItem(
        idcontroller.text, namecontroller.text, dobcontroller.text, emailcontroller.text,mobilecontroller.text);
  }
  Future<void> updateItem() async {
    await DatabaseHelper.updateItem(
        idcontroller.text, namecontroller.text, dobcontroller.text, emailcontroller.text, mobilecontroller.text);
  }

  void showMyForm (int?id)async {
    if(id != null){
      final existingData = myData.firstWhere((element) => element['id']==id);
      idcontroller.text = existingData ['id'];
      namecontroller.text = existingData ['name'];
      dobcontroller.text = existingData ['dob'];
      emailcontroller.text = existingData ['email'];
      mobilecontroller.text = existingData ['mobile'];
    }else {
      idcontroller.text ="";
      namecontroller.text = "";
      dobcontroller.text = "";
      emailcontroller.text ="";
      mobilecontroller.text = "";
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
                controller: idcontroller,
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
                controller: namecontroller,
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
                controller: dobcontroller,
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
                controller: emailcontroller,
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
                controller: mobilecontroller,
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
                    child: Text('Add Detail'),
                      onPressed: () async {
                        if (formKey.currentState!.validate()){
                          addItem();
                          // updateItem();
                      setState(() {
                        idcontroller.text= '';
                        namecontroller.text = '';
                        dobcontroller.text = '';
                        emailcontroller.text = '';
                        mobilecontroller.text = '';
                      });
                        Navigator.pop(context);
                        }
                      },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}




