import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joi/app/user/MyWallet/MyTransaction.dart';
import 'package:joi/app/user/MyWallet/MyWallet.dart';
import 'package:joi/app/user/chatcall/ChatCall.dart';
import 'package:joi/app/user/journal/Journal.dart';
import 'package:joi/app/user/livepsychologist/LivePsychologist.dart';
import 'package:joi/app/user/login/Login.dart';
import 'package:joi/app/user/profile/Profile.dart';
import 'package:joi/app/user/yoga/Yoga.dart';
import 'package:joi/app/user/yogapractitioner/YogaPractitioner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> data = [
    {
      "profile": "assets/images/children.png",
      "name": "Mr Prashant Yadav",
      "language": "hindi,English",
      "exp": "02",
      "rate": "40/15 min"
    },
    {
      "profile": "assets/images/children.png",
      "name": "Mr Prashant Yadav",
      "language": "hindi,English",
      "exp": "02",
      "rate": "40/15 min"
    },
    {
      "profile": "assets/images/children.png",
      "name": "Mr Prashant Yadav",
      "language": "hindi,English",
      "exp": "02",
      "rate": "40/15 min"
    },
    {
      "profile": "assets/images/children.png",
      "name": "Mr Prashant Yadav",
      "language": "hindi,English",
      "exp": "02",
      "rate": "40/15 min"
    },
    {
      "profile": "assets/images/fear.png",
      "name": "Mr Prashant Yadav",
      "language": "hindi,English",
      "exp": "02",
      "rate": "40/15 min"
    }
  ];
  final List<Map<String, dynamic>> items = [
    {"image": "assets/images/fear.png", "text": "FEAR", "color": Colors.orange},
    {
      "image": "assets/images/anxiety.png",
      "text": "ANXIETY",
      "color": Color.fromARGB(255, 147, 199, 230)
    },
    {
      "image": "assets/images/stress.png",
      "text": "STRESS",
      "color": Colors.green
    },
    {
      "image": "assets/images/depression.png",
      "text": "DEPRESSION",
      "color": Colors.red
    },
    {
      "image": "assets/images/image5.png",
      "text": "text",
      "color": Colors.amber
    },
  ];
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 3;

    if (_selectedIndex == 3) {
      GestureDetector(
        onTap: () => {},
      );
    }

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        //   physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
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
                            margin:
                                EdgeInsets.only(left: 10, right: 10, top: 60),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      {_scaffoldKey.currentState?.openDrawer()},
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                          'assets/images/menu.svg'),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Dashboard",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Hi User !",
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
                                                builder: (context) =>
                                                    MyWallet(),
                                              ))
                                        },
                                    child: SvgPicture.asset(
                                        'assets/images/wallet.svg'))
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
                              color:
                                  Colors.black, // Border color when not focused
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
                Container(
                    height: 120,
                    // color: Colors.amberAccent,
                    child: GridView.builder(
                      scrollDirection: Axis
                          .horizontal, // Set the scroll direction to horizontal
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, // Display only one item per row
                          mainAxisSpacing: 0.0,
                          crossAxisSpacing: 0.0,
                          mainAxisExtent: 100),
                      itemBuilder: (context, index) {
                        return GridItem(
                          imageUrl: items[index]["image"]!,
                          backgroundColor: items[index]["color"],
                          text: items[index]["text"]!,
                        );
                      },
                    )),
              ],
            ),
            SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Live Psychologist",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LivePsychologist()),
                          )
                        },
                        child: Text(
                          "See all >",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 242,
                  //color: const Color.fromARGB(255, 226, 99, 99),
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, // Display only one item per row
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 0.0,
                          mainAxisExtent: 150),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Stack(children: [
                            Container(
                              child: Container(
                                height: 230,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.yellow,

                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(3),
                                            bottomRight: Radius.circular(3)),
                                      ),
                                      child: ClipRRect(
                                        // borderRadius: BorderRadius.circular(10),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(3),
                                            bottomRight: Radius.circular(3)),
                                        child: Image.asset(
                                          "assets/images/image.png",
                                          height: 150,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                          filterQuality: FilterQuality.high,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data[index]["name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      data[index]["language"],
                                      // style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Exp=" +
                                              data[index]["exp"] +
                                              " |" ' ₹${data[index]["rate"]}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    )
                                  ],
                                  //  Text(data[index]["name"],
                                  // )
                                ),
                              ),
                            ),
                            Container(
                              // color: Colors.yellow,
                              height: 25,
                              margin: EdgeInsets.only(
                                  top: 215, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xFF70940D),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Chat Now",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 30,
                                    //  padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Color(0xFF70940D),
                                        )),
                                    child: SvgPicture.asset(
                                        'assets/images/call.svg'),
                                  )
                                ],
                              ),
                            )
                          ]),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Yoga Practitioner",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YogaPractitioner()),
                          )
                        },
                        child: Text(
                          "See all >",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 242,
                  // color: const Color.fromARGB(255, 226, 99, 99),
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, // Display only one item per row
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 0.0,
                          mainAxisExtent: 150),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Stack(children: [
                            Container(
                              child: Container(
                                height: 230,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.yellow,

                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(3),
                                            bottomRight: Radius.circular(3)),
                                      ),
                                      child: ClipRRect(
                                        // borderRadius: BorderRadius.circular(10),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(3),
                                            bottomRight: Radius.circular(3)),
                                        child: Image.asset(
                                          "assets/images/prashant.png",
                                          height: 150,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                          filterQuality: FilterQuality.high,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data[index]["name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      data[index]["language"],
                                      // style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Exp=" +
                                              data[index]["exp"] +
                                              " |" ' ₹${data[index]["rate"]}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    )
                                  ],
                                  //  Text(data[index]["name"],
                                  // )
                                ),
                              ),
                            ),
                            Container(
                              // color: Colors.yellow,
                              height: 25,
                              margin: EdgeInsets.only(
                                  top: 215, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xFF70940D),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Chat Now",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 30,
                                    //  padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Color(0xFF70940D),
                                        )),
                                    child: SvgPicture.asset(
                                        'assets/images/call.svg'),
                                  )
                                ],
                              ),
                            )
                          ]),
                        );
                      }),
                ),
              ]),
            ),
          ],
        ),
      ),

      // Drawer start================================================================================
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
                    onTap: () => {_scaffoldKey.currentState?.closeDrawer()},
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ))
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/psychologist.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('Psychalagist'),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LivePsychologist(),
                    ))
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/yogapractitioner.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('Yoga Practitioner'),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YogaPractitioner(),
                    ))
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ))
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyTransaction(),
                      ));
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
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/myprofile.svg',
                width: 22.0, // Set the desired width
                height: 22.0, // Set the desired height
              ),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation logic here
              },
            ),
          ],
        ),
      ),

// Drawer End=======================================================================================================

// Start===============================================================================================================
    );
  }
}
// BottomNavigation End==================================================================================================================

class GridItem extends StatelessWidget {
  final String? imageUrl;
  final String? text;
  final Color? backgroundColor;

  GridItem({this.imageUrl, this.text, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: CircleAvatar(
              backgroundImage: imageUrl != null ? AssetImage(imageUrl!) : null,
              backgroundColor: backgroundColor,
              radius: 35,
              // Adjust the size of the circle
            ),
          ),
          SizedBox(height: 8),
          Text(
            text ?? '',
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Home(),
    Profile(),
    Journal(),
    ChatCall(),
    Yoga()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            //  icon: SvgPicture.asset("assets/images/home.svg"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            // icon: SvgPicture.asset("assets/images/profile.svg"),
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            // icon: SvgPicture.asset("assets/images/work.svg"),
            icon: Icon(Icons.book),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Chat/Call',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/yoga.png"),
            label: 'Yoga',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,

        unselectedItemColor: Color(0xFF858EA9),
        onTap: _onItemTapped,

        // onTap: _onItemTapped,
      ),
    );
  }
}
