import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseAddUser extends StatefulWidget {
  const FirebaseAddUser({super.key});

  @override
  State<FirebaseAddUser> createState() => _FirebaseAddUserState();
}

class _FirebaseAddUserState extends State<FirebaseAddUser> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _agecontroller = TextEditingController();
  TextEditingController _gendercontroller = TextEditingController();
  TextEditingController _mobilenocontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();

  void _adduser() {
    Map<String, dynamic> userdeatil = {
      "name": _namecontroller.text,
      "age": _agecontroller.text,
      "gender": _gendercontroller.text,
      "mobile no": _mobilenocontroller.text,
      "address": _agecontroller.text
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("user_details");
    collectionReference.add(userdeatil);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name"),
              Container(
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  height: 50,
                  child: TextField(
                    controller: _namecontroller,
                    decoration: InputDecoration(
                      hintText: "Name",
                      contentPadding: EdgeInsets.only(left: 5, right: 5),
                      // labelText: 'Name',
                      //   labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  )),
              Text("Age"),
              Container(
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  height: 50,
                  child: TextField(
                    controller: _agecontroller,
                    decoration: InputDecoration(
                      hintText: "Age",
                      contentPadding: EdgeInsets.only(left: 5, right: 5),
                      // labelText: 'Name',
                      //   labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  )),
              Text("Gender"),
              Container(
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  height: 50,
                  child: TextField(
                    controller: _gendercontroller,
                    decoration: InputDecoration(
                      hintText: "Gender",
                      contentPadding: EdgeInsets.only(left: 5, right: 5),
                      // labelText: 'Name',
                      //   labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  )),
              Text("Mobile no"),
              Container(
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  height: 50,
                  child: TextField(
                    controller: _mobilenocontroller,
                    decoration: InputDecoration(
                      hintText: "Mobile no",
                      contentPadding: EdgeInsets.only(left: 5, right: 5),
                      // labelText: 'Name',
                      //   labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  )),
              Text("Address"),
              Container(
                  margin: EdgeInsets.only(top: 5, bottom: 10),
                  height: 50,
                  child: TextField(
                    controller: _addresscontroller,
                    decoration: InputDecoration(
                      hintText: "address",
                      contentPadding: EdgeInsets.only(left: 5, right: 5),
                      // labelText: 'Name',
                      //   labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  )),
              Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () => {_adduser()}, child: Text("Add User")))
            ],
          ),
        ),
      ),
    );
  }
}
