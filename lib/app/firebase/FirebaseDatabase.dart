import 'package:flutter/material.dart';

import 'package:joi/app/firebase/FirebaseAddUser.dart';

class FirebaseDatabase extends StatefulWidget {
  const FirebaseDatabase({super.key});

  @override
  State<FirebaseDatabase> createState() => _FirebaseDatabaseState();
}

class _FirebaseDatabaseState extends State<FirebaseDatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Database"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FirebaseAddUser(),
                          ))
                    },
                child: Text("Add user"))
          ],
        ),
      ),
    );
  }
}
