import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joi/app/doctor/appointmentList/AppointmentList.dart';
import 'package:joi/app/user/MyWallet/MyWallet.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHome();
}

class _DoctorHome extends State<DoctorHome> {
  final GlobalKey<ScaffoldState> _scaffoldKeyD = GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> items = [
    {"name": "Prashant Yadav", "date": "16 March 2024", "time": "11:15 AM"},
    {"name": "Akash Singh", "date": "15 March 2024", "time": "01:15 PM"},
    {"name": "Anuj Maurya", "date": "18 March 2024", "time": "04:15 PM"},
    {"name": "Ankit Sharma", "date": "19 March 2024", "time": "06:15 PM"},
    {"name": "Vijay Pal", "date": "20 March 2024", "time": "11:00 AM"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeyD,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Colors.white,
            child: Stack(children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                    color: Color(0xFFD0E29D),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 60),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => {
                              // _scaffoldKeyD.currentState?.openDrawer()
                              _scaffoldKeyD.currentState?.openDrawer()
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child:
                                    SvgPicture.asset('assets/images/menu.svg'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dashboard",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Psychologist/Yoga....",
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyWallet(),
                                        ))
                                  },
                              child:
                                  SvgPicture.asset('assets/images/wallet.svg'))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 150, left: 30, right: 30),
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: TextStyle(color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black, // Border color when not focused
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green, // Border color when focused
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  width: 160,
                  alignment: Alignment.center,
                  //  padding:
                  //      EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/date.png",
                        height: 40,
                        width: 40,
                      ),
                      Text("Manage Slot",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/message.png",
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "9990+",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Text("Total consultations",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 490,

            width: double.infinity,
            padding: EdgeInsets.only(left: 15, right: 15),
            //  alignment: Alignment.topLeft,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Latest Appointment",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentList(),
                              ))
                        },
                        child: Text(
                          "More",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 70),
                    //  padding: EdgeInsets.only(left: 20, right: 20),
                    // height: 600,
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: items.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, // Display only one item per row
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 0.0,
                            mainAxisExtent: 170),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(children: [
                                IntrinsicHeight(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/images/calender.svg"),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              items[index]["date"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                            SvgPicture.asset(
                                                "assets/images/time.svg"),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              items[index]["time"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        Text(
                                            "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ClipOval(
                                              // borderRadius: BorderRadius.only(
                                              //     topLeft: Radius.circular(10),
                                              //     topRight: Radius.circular(10),
                                              //     bottomLeft: Radius.circular(10),
                                              //     bottomRight: Radius.circular(10)),
                                              child: Image.asset(
                                                "assets/images/human.png",
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.fill,
                                                //  filterQuality: FilterQuality.high,
                                              ),
                                            ),
                                            SizedBox(width: 7),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    items[index]["name"],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 4,
                                                                  bottom: 4,
                                                                  left: 6,
                                                                  right: 6),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .green),
                                                              color:
                                                                  Colors.green,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5))),
                                                          child: Row(children: [
                                                            SvgPicture.asset(
                                                                "assets/images/Vector1.svg"),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              "Chat",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ]),
                                                        ),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 4,
                                                                    bottom: 4,
                                                                    left: 6,
                                                                    right: 6),
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF333333),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                            child: Row(
                                                              children: [
                                                                SvgPicture.asset(
                                                                    "assets/images/Vector3.svg"),
                                                                SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Text(
                                                                  "Call",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ],
                                                            )),
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5,
                                                                    bottom: 5,
                                                                    left: 6,
                                                                    right: 6),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .green),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                            child: Row(
                                                              children: [
                                                                SvgPicture.asset(
                                                                    "assets/images/Vector2.svg"),
                                                                SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Text(
                                                                  "Video",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .green),
                                                                ),
                                                              ],
                                                            ))
                                                      ])
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                              ]),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 120,
              padding: EdgeInsets.all(10),
              //margin: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prashant Yadav",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text("9994567890",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => {_scaffoldKeyD.currentState?.closeDrawer()},
                    child: SvgPicture.asset(
                      'assets/images/close.svg',
                      height: 25,
                      width: 25,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Color(0xFFD0E29D)),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/dashboard.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('Dashboard'),
              onTap: () => {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Dashboard(),
                //     ))
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/myclient.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('My Client'),
              onTap: () => {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => LivePsychologist(),
                //     )
                //     )
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/myprofile.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('My Profile'),
              onTap: () => {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Profile(),
                //     ))
              },
            ),
            ListTile(
                leading: SvgPicture.asset(
                  'assets/images/work.svg',
                  color: Colors.black,
                  width: 22.0, // Set the desired width
                  height: 22.0, // Set the desired height
                ),
                title: Text('Payment'),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => MyTransaction(),
                  //     ));
                }),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/myappointmenyt.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('My Appointments'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/myslot.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('My Slot'),
              onTap: () => {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => YogaPractitioner(),
                //     ))
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/mychat.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('My Chat'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/mycall.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('My Call'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/privacy.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('Privacy & Policy'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/help.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('Help Center'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 67,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFFD0E29D)),
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/logout.svg"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
