import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joi/app/user/MyWallet/MyTransaction.dart';

class TransactionDetail extends StatefulWidget {
  const TransactionDetail({super.key});

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7EA11C),
        title: Text(
          "Payment History Detail",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyTransaction(),
                ))
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Color(0xFFF6FBE9),
            padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "₹ 500",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("Successful  7 April 2024")
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Transaction ID",
                  style: TextStyle(fontSize: 18),
                ),
                Text("#8749479437437HBJSGK8778")
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Consultation Time",
                  style: TextStyle(fontSize: 18),
                ),
                Text("60 Mins")
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10, left: 15),
              child: Text(
                "Paid From",
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey)),
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/paid.svg"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Amount Paid"),
                      Spacer(),
                      Text("₹ 500")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 5),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/smallwallet.svg"),
                      SizedBox(
                        width: 3,
                      ),
                      Text("Wallet Amount Utilized"),
                      Spacer(),
                      Text("₹ -50")
                    ],
                  ),
                ),
                Container(
                  child: Text(
                      " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/rupees.svg"),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Total Amount"),
                      Spacer(),
                      Text("₹ 450")
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
