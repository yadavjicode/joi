import 'package:flutter/material.dart';
import 'package:joi/app/user/login/Question.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  //final List<String> items = List.generate(10, (index) => "english");
  final List<String> items = [
    'English',
    'Hindi',
    'Bengali',
    'Marathi',
    'Telugu',
    'Tamil',
    'Kannada',
    'Gujarati',
    'Odia',
    'Assamese',
  ];
  List<bool> isSelected = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, // Change this to your desired color
        ),
        title: Container(
          margin: EdgeInsets.only(top: 15, right: 20),
          child: Text(
            "Comfortable taking in which\nlanguage?",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 72),
            child: Text(
              "1 language selected tap another\nto select more",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              height: 300,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns in the grid
                  crossAxisSpacing: 2.0, // Spacing between columns
                  mainAxisSpacing: 2.0, // Spacing between rows
                  childAspectRatio: 1 / 0.7,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        var value = items[index];
                        if (isSelected[index] == true) {
                          isSelected[index] = false;
                          for (int i = 0; i < isSelected.length; i++) {
                            if (i != index) {
                              isSelected[i] = false;
                            }
                          }
                        } else {
                          for (int i = 0; i < isSelected.length; i++) {
                            if (i != index) {
                              isSelected[i] = false;
                            }
                          }
                          isSelected[index] = true;
                          // Select the new item
                        }
                        print("value=$value$index}");
                      });
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected[index]
                            ? Color(0xFFFBFFD1)
                            : Colors.white,
                        border: Border.all(
                            color: isSelected[index]
                                ? Colors.green
                                : Colors.black), // Black border
                      ),
                      child: Text(
                        items[index],
                        style: TextStyle(
                            color:
                                isSelected[index] ? Colors.green : Colors.black,
                            fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 50),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Question()))
              },
              child: Text(
                "Submit",
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
