import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joi/app/user/profile/ProfileEdit.dart';
import 'package:joi/app/user/profile/UploadProfile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Color(0xFF7EA11C),
            padding: EdgeInsets.only(top: 40, bottom: 10, right: 10, left: 10),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadProfile(),
                        ))
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/children.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mr Prashant Yadav",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text("+91-9978484848",
                        style: TextStyle(color: Colors.white))
                  ],
                ),
                Spacer(),
                SvgPicture.asset("assets/images/whitemenu.svg")
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.green)),
            child: Column(
              children: [
                Row(children: [
                  Container(
                    //  padding: EdgeInsets.only(left: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Personal Info",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileEdit(),
                          ))
                    },
                    child: Stack(children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/images/editback.png"),
                      ),
                      Container(
                        width: 50,
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: SvgPicture.asset("assets/images/edit.svg"),
                      ),
                    ]),
                  )
                ]),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Prashnat Yadav"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Gender",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Male"),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "prashantyadav3602\n@gmail.com",
                          style: TextStyle(overflow: TextOverflow.visible),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date of Birth",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("08/07/2002"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Phone",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("+91_9984837384"),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Location",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "India",
                          style: TextStyle(overflow: TextOverflow.visible),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("My Psychologist", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 1,
                  color: Colors.grey,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("My Call History", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 1,
                  color: Colors.grey,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("My Chat History", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 1,
                  color: Colors.grey,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("My Appointments", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  height: 1,
                  color: Colors.grey,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("Change Password", style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
