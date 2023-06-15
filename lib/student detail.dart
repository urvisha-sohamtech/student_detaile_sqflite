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

  void refreshData() async {
    final data = await DatabaseHelper.getData();
    setState(() {
      myData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  Future<void> addItem() async {
    await DatabaseHelper.insert(
        idcontroller.text,
        namecontroller.text,
        dobcontroller.text,
        emailcontroller.text,
        mobilecontroller.text);
    refreshData();
  }

  Future<void> updateItem() async {
    await DatabaseHelper.updateItem(
        idcontroller.text,
        namecontroller.text,
        dobcontroller.text,
        emailcontroller.text,
        mobilecontroller.text);
    refreshData();
  }

  void deleteItem(int id) async{
    await DatabaseHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('deleted')));
    refreshData();
  }

  void showform(int? id) async {
    if (id != null) {
      final existingdata =
      myData.firstWhere((element) => element['id'] == id);
      idcontroller.text = existingdata['id'].toString();
      namecontroller.text = existingdata['name'];
      dobcontroller.text = existingdata['dob'];
      emailcontroller.text = existingdata['email'];
      mobilecontroller.text = existingdata['mobile'].toString();
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) =>
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, bottom: MediaQuery.of(context).viewInsets.bottom + 50, right: 15),
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                      child: Text(id == null ? 'Add Detail' : 'Update'),
                      onPressed: () {
                        addItem();
                        updateItem();
                        idcontroller.text = '';
                        namecontroller.text = '';
                        dobcontroller.text = '';
                        emailcontroller.text = '';
                        mobilecontroller.text = '';
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(id == null? 'New Student Add' : ' update data')));
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
      body: ListView.builder(
          itemCount: myData.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(child:Icon(Icons.edit)),
              secondaryBackground: Container(child: Icon(Icons.delete)),
              confirmDismiss: (direction) async {
                if(direction == DismissDirection.startToEnd){
                  showform(myData[index]['id']);
                }else{
                  if(direction ==  DismissDirection.endToStart){
                    deleteItem(myData[index]['id']);
                  }
                }
              },
              child: Card(
                color: Colors.black54,
                margin: EdgeInsets.all(10),
                elevation: 5,
                child: ListTile(
                  title: Text('Id: ' + myData[index]['id'].toString(),),
                  subtitle: Text( 'Name: ' + myData[index]['name'] ),
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                             Detail(student: Student(id: myData[index]['id'], name:myData[index]['name'], dob:myData[index]['dob'], email: myData[index]['email'], mobile: myData[index]['mobile'].toString()))));
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showform(null),
        // {Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddStudent()));},
        child: Icon(Icons.add,),
        backgroundColor: Colors.black,
      ),
    );
  }
}
