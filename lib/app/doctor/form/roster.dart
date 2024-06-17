import 'package:flutter/material.dart';
import 'package:joi/app/doctor/dashboard/DoctorDashboard.dart';
import 'package:joi/app/util/custom/customsnackbar/CustomSnackbar.dart';

class Roaster extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  const Roaster({super.key, required this.currentIndex, required this.onTap});

  @override
  State<Roaster> createState() => _RoasterState();
}

class _RoasterState extends State<Roaster> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerP = TextEditingController();
  bool _Select = false;
  bool _isSubmitted = false;

  bool validaion() {
    return _controller.text.isNotEmpty &&
        _controllerP.text.isNotEmpty &&
        _Select == true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How many hours can you contribute daily?",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 10),
            child: TextField(
              controller: _controller,
              // maxLines: 5,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                errorText: _isSubmitted && _controller.text.isEmpty
                    ? 'Please provide a value'
                    : null,
              ),
            ),
          ),
          Text(
            "What will be your consultation charge?",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.grey)),
                  child: Text("20 Min", style: TextStyle(color: Colors.grey)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.grey)),
                  child: Text(
                    "Corresponding charges",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Are you working on any other online platform?",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 10),
            child: TextField(
              controller: _controllerP,
              // maxLines: 5,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                errorText: _isSubmitted && _controllerP.text.isEmpty
                    ? 'Please provide a value'
                    : null,
              ),
            ),
          ),
          Text(
            "Main Source of income",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            alignment: Alignment.centerLeft,
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.grey)),
            child: Text(
              "Own Business",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 22,
                  width: 20,
                  child: Checkbox(
                      value: _Select,
                      onChanged: (bool? value) {
                        setState(() {
                          _Select = value!;
                        });
                      }),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                    "I agree with the Terms & Conditions.\nprivacy policy, disclaimer and\ncancellation policy"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => widget.onTap(2),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.grey,
                    ),
                    child: Text("Previous"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSubmitted = true;
                      // widget.onTap(3); // Mark the form as submitted
                    });
                    // Validate the form
                    if (validaion()) {
                      setState(() {
                        // widget.onTap(2);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorDashboard()));
                      });

                      // Navigate to the next screen
                    }
                    if (_Select == false) {
                      CustomSanckbar.showSnackbar(
                          context, "Please select term and condition");
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color(0xFF7EA11C),
                    ),
                    child: Text("Next"),
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
