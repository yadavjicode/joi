import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joi/app/user/MyWallet/MyWallet.dart';
import 'package:joi/app/user/MyWallet/TransactionDetail.dart';
import 'package:joi/app/user/dashboard/dashboard.dart';

class MyTransaction extends StatefulWidget {
  const MyTransaction({super.key});

  @override
  State<MyTransaction> createState() => _MyTransactionState();
}

class _MyTransactionState extends State<MyTransaction> {
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
          "Payment History",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyWallet(),
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
            Row(
              children: [
                Text(
                  "Latest Transaction",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                SvgPicture.asset("assets/images/filter.svg")
              ],
            ),
            Flexible(
              child: Container(
                // height: 350,
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
                margin: EdgeInsets.only(bottom: 0, top: 10),
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
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TransactionDetail(),
                                ))
                          },
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
                                SvgPicture.asset(
                                    "assets/images/transicons.svg"),
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
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
