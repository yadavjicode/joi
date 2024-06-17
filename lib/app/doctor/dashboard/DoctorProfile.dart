import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joi/app/doctor/dashboard/DoctorDashboard.dart';
import 'package:joi/app/user/login/Language.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xFF7EA11C),
            height: 80,
            padding: EdgeInsets.all(10),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDashboard(),
                        ))
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "   My Profile",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      child: Image.asset(
                        "assets/images/image.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                        //  filterQuality: FilterQuality.high,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mr. Prashant Yadav",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "assets/images/mobile.svg",
                              height: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "+91-9971243603",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "assets/images/email.svg",
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              height: 40,
                              width: 200,
                              child: Text(
                                "prashantyadav3602@gmail.com",
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 160,
                        child: Text(
                          "Age: 22",
                          style: TextStyle(fontSize: 15),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFE1FFF6),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 160,
                        child: Text(
                          "Gender: Male",
                          style: TextStyle(fontSize: 15),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFE1FFF6),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  child: Text(
                    "Country: India",
                    style: TextStyle(fontSize: 15),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFFE1FFF6),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 160,
                        child: Text(
                          "City: New Delhi",
                          style: TextStyle(fontSize: 15),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFE1FFF6),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 160,
                        child: Text(
                          "Pincode: 201001",
                          style: TextStyle(fontSize: 15),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFE1FFF6),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Language Known",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 10),
                      child: Text(
                        "English",
                        style: TextStyle(fontSize: 15),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFF7E3),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 10),
                      child: Text(
                        "Hindi",
                        style: TextStyle(fontSize: 15),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFF7E3),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 10),
                      child: Text(
                        "Bengali",
                        style: TextStyle(fontSize: 15),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFF7E3),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Designation",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    )),
                Container(
                  width: double.infinity,
                  color: Color(0xFFFFF7E3),
                  padding: EdgeInsets.only(top: 12, bottom: 12, left: 15),
                  alignment: Alignment.topLeft,
                  child: Text("Psychologist"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
