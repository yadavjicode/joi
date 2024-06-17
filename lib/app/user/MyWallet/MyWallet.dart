import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joi/app/user/MyWallet/MyTransaction.dart';
import 'package:joi/app/user/dashboard/dashboard.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  final List<Map<String, dynamic>> items = [
    {
      "name": "Prashant Yadav",
      "date": "07-Apr-2024",
      "balance": "500",
      "time": "11:32 PM",
    },
    {
      "name": "Vikash Singh",
      "date": "07-Apr-2024",
      "balance": "500",
      "time": "11:32 PM",
    },
    {
      "name": "Anuj Maurya",
      "date": "07-Apr-2024",
      "balance": "500",
      "time": "11:32 PM",
    },
    {
      "name": "Anjani Srivastav",
      "date": "07-Apr-2024",
      "balance": "500",
      "time": "11:32 PM",
    },
    {
      "name": "Vijay Pal",
      "date": "07-Apr-2024",
      "balance": "500",
      "time": "11:32 PM",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7EA11C),
        title: Text(
          "My Wallet",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dashboard(),
                ))
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/wallet2.svg"),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Current Balance"),
                        Text(
                          "₹ 500",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(
              "Latest Transaction",
              style: TextStyle(fontSize: 18),
            ),
            Flexible(
              child: Container(
                height: 350,
                padding: EdgeInsets.all(5),
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
                margin: EdgeInsets.only(bottom: 10, top: 10),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Display only one item per row
                        // mainAxisSpacing: 10.0,
                        crossAxisSpacing: 0.0,
                        mainAxisExtent: 80),
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
                            //border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(children: [
                            Row(children: [
                              // Text(items[index]["name"]),
                              SvgPicture.asset("assets/images/transicons.svg"),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(items[index]["name"]),
                                  Row(
                                    children: [
                                      Text(items[index]["date"]),
                                      Text(" | "),
                                      Text(items[index]["time"])
                                    ],
                                  )
                                ],
                              ),
                              Spacer(),
                              Text("₹ " + items[index]["balance"])
                            ]),
                            Spacer(),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            )
                          ]),
                        ),
                      );
                    }),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyTransaction(),
                      ))
                },
                child: Container(
                  padding:
                      EdgeInsets.only(left: 40, right: 40, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                      color: Color(0xFF7EA11C),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(
                    "View All",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
