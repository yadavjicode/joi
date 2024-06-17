import 'package:flutter/material.dart';
import 'package:joi/app/util/custom/customsnackbar/CustomSnackbar.dart';

class Education extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  const Education({super.key, required this.currentIndex, required this.onTap});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  bool _isCheckedA = false,
      _isCheckedB = false,
      _isCheckedC = false,
      _isCheckedD = false,
      _isCheckedE = false,
      _isCheckedF = false,
      _isCheckedG = false,
      _isCheckedH = false,
      _isCheckedI = false;

  bool P = false;
  bool Y = false;
  bool _isSubmitted = false;
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _consultController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    _degreeController.dispose();
    _experienceController.dispose();
    _consultController.dispose();
    _instagramController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  bool _allFieldsFilled() {
    return _degreeController.text.isNotEmpty &&
        _experienceController.text.isNotEmpty &&
        _consultController.text.isNotEmpty &&
        _instagramController.text.isNotEmpty &&
        _reasonController.text.isNotEmpty &&
        ((_isCheckedA == true) ||
            (_isCheckedB == true) ||
            (_isCheckedC == true) ||
            (_isCheckedD == true) ||
            (_isCheckedE == true) ||
            (_isCheckedF == true) ||
            (_isCheckedG == true) ||
            (_isCheckedH == true) ||
            (_isCheckedI == true)) &&
        (P == true || Y == true);
  }

  /* void _clearAllFields() {
    setState(() {
      _degreeController.clear();
      _experienceController.clear();
      _consultController.clear();
      _instagramController.clear();
      _reasonController.clear();
      _isCheckedA = false;
      _isCheckedB = false;
      _isCheckedC = false;
      _isCheckedD = false;
      _isCheckedE = false;
      _isCheckedF = false;
      _isCheckedG = false;
      _isCheckedH = false;
      _isCheckedI = false;
    });
  }  */

  void _showValidationMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Validation Error'),
        content: Text('Please fill all the fields.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You are ?",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => {
                    if (P == false)
                      setState(() {
                        P = true;
                        Y = false; // Set to true when this container is tapped
                      })
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 38, right: 38),
                    decoration: BoxDecoration(
                        color: P ? Colors.grey : Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text("Psychologist"),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    if (Y == false)
                      setState(() {
                        Y = true;
                        P = false; // Set to true when this container is tapped
                      })
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 25, right: 25),
                    child: Text("Yoga Practitioner"),
                    decoration: BoxDecoration(
                        color: Y ? Colors.grey : Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Highest degree attained? Details",
            style: TextStyle(fontSize: 18),
          ),
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              child: TextField(
                controller: _degreeController,
                maxLines: 5,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  counterText: '',
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
                  errorText: _isSubmitted && _degreeController.text.isEmpty
                      ? 'Please provide a value'
                      : null,
                ),
              )),
          Text(
            "Total Work experience in years",
            style: TextStyle(fontSize: 18),
          ),
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              child: TextField(
                controller: _experienceController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  counterText: '',
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
                  errorText: _isSubmitted && _experienceController.text.isEmpty
                      ? 'Please provide a value'
                      : null,
                ),
              )),
          Text(
            "Area will you consult for?",
            style: TextStyle(fontSize: 18),
          ),
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              child: TextField(
                controller: _consultController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  counterText: '',
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
                  errorText: _isSubmitted && _consultController.text.isEmpty
                      ? 'Please provide a value'
                      : null,
                ),
              )),
          Text(
            "What will you consult for ?",
            style: TextStyle(fontSize: 18),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: _isCheckedA,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedA = value!;
                            });
                          }),
                      Text(
                        "Anxiety",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: _isCheckedB,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedB = value!;
                            });
                          }),
                      Text("Depression", style: TextStyle(fontSize: 15))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: _isCheckedC,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedC = value!;
                            });
                          }),
                      Text("Just Talk", style: TextStyle(fontSize: 15))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: _isCheckedD,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedD = value!;
                            });
                          }),
                      Text("Bad Mood", style: TextStyle(fontSize: 15))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: _isCheckedE,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedE = value!;
                            });
                          }),
                      Text("Panic Attack", style: TextStyle(fontSize: 15))
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: _isCheckedF,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedF = value!;
                            });
                          }),
                      Text(
                        "Stress",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: _isCheckedG,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedG = value!;
                            });
                          }),
                      Text("Sex Abuse", style: TextStyle(fontSize: 15))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: _isCheckedH,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedH = value!;
                            });
                          }),
                      Text("Relationship/couple\nadvice",
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: _isCheckedI,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCheckedI = value!;
                            });
                          }),
                      Text("child [teenage] issues",
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                ],
              )
            ],
          ),
          Text(
            "Instagram profile link (if suitable)",
            style: TextStyle(fontSize: 18),
          ),
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              child: TextField(
                controller: _instagramController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  counterText: '',
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
                  errorText: _isSubmitted && _instagramController.text.isEmpty
                      ? 'Please provide a value'
                      : null,
                ),
              )),
          Text(
            "Why do you think we sholud onboard you?",
            style: TextStyle(fontSize: 18),
          ),
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              child: TextField(
                controller: _reasonController,
                maxLines: 5,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  counterText: '',
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
                  errorText: _isSubmitted && _reasonController.text.isEmpty
                      ? 'Please provide a value'
                      : null,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => widget.onTap(0),
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
                    });
                    if ((_isCheckedA == false) &&
                        (_isCheckedB == false) &&
                        (_isCheckedC == false) &&
                        (_isCheckedD == false) &&
                        (_isCheckedE == false) &&
                        (_isCheckedF == false) &&
                        (_isCheckedG == false) &&
                        (_isCheckedH == false) &&
                        (_isCheckedI == false)) {
                      CustomSanckbar.showSnackbar(
                          context, "Please select consult option");
                    }
                    if (P == false && Y == false) {
                      CustomSanckbar.showSnackbar(
                          context, "Please select You are");
                    }

                    if (_allFieldsFilled()) {
                      widget.onTap(2);
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
