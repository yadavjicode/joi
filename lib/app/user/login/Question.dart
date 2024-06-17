import 'package:flutter/material.dart';
import 'package:joi/app/user/dashboard/dashboard.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int? _selectedOption;
  bool d = false;

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
          "Answer Few Questionnaire",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Text(
              "Question 1:",
              style: TextStyle(fontSize: 20),
            )),
            Container(
              child: Text(
                "I feel sad or low ?",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 129, 126, 126)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: d ? Color(0xFFFBFFD1) : Colors.white,
                  border: Border.all(
                      width: 2, color: d ? Color(0xFF7EA11C) : Colors.black)),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Sad",
                      style: TextStyle(
                          fontSize: 20, color: d ? Colors.green : Colors.black),
                    ),
                  ),
                  Spacer(),
                  Radio(
                    value: 0,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value;
                        d = true;
                        print("sad"); // Update selected value
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: d ? Colors.white : Color(0xFFFBFFD1),
                  border: Border.all(
                      width: 2, color: d ? Colors.black : Color(0xFF7EA11C))),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Low",
                      style: TextStyle(
                          fontSize: 20, color: d ? Colors.black : Colors.green),
                    ),
                  ),
                  Spacer(),
                  Radio(
                    value: 1,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value;
                        d = false;
                        print("low"); // Update selected value
                      });
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard())),
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
