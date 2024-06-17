import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:joi/app/user/login/Language.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, // Change this to your desired color
        ),
        title: Text(
          "Do you need help for",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xFFFBFFD1), // Background color
                border: Border.all(
                  color: Color(0xFF7EA11C), // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: Image.asset('assets/images/girl.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Individual",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF7EA11C),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "For self",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset('assets/images/icon.svg'),
                  ),
                ],
              ),
            ),
          ),
          Center(
              child: Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              color: Color(0xFFF1FFDF), // Background color
              border: Border.all(
                color: Color(0xFF7EA11C), // Border color
                width: 2.0, // Border width
              ),
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Image.asset('assets/images/couple.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Couple",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF7EA11C),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        "For myself & partner",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset('assets/images/icon.svg'),
                ),
              ],
            ),
          )),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xFFFBFFD1), // Background color
                border: Border.all(
                  color: Color(0xFF7EA11C), // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: Image.asset('assets/images/children.png'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Child",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF7EA11C),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "For teen age",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset('assets/images/icon.svg'),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 50),
            // padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Language()))
              },
              child: Text(
                "Continue",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF7EA11C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Change this value to adjust the border radius
                ), // Set the background color
              ),
            ),
          )
        ],
      ),
    );
  }
}
