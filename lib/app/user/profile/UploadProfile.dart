import 'package:flutter/material.dart';
import 'package:joi/app/user/profile/Profile.dart';

class UploadProfile extends StatefulWidget {
  const UploadProfile({super.key});

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7EA11C),
        title: Text(
          "Upload Profile Pic",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ))
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey)),
            margin: EdgeInsets.only(
              top: 30,
              left: 25,
              right: 25,
            ),
            child: Image.asset(
              "assets/images/plus.png",
              height: 50,
              width: 50,
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.only(top: 8, bottom: 8),
            margin: EdgeInsets.only(bottom: 30, left: 20, right: 20),
            decoration: BoxDecoration(
                color: Color(0xFF7EA11C),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey)),
            child: Text(
              "Save Changes",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
