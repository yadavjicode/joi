import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joi/app/util/custom/customsnackbar/CustomSnackbar.dart';

class BackVerification extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  const BackVerification(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  State<BackVerification> createState() => _BackVerificationState();
}

class _BackVerificationState extends State<BackVerification> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerP = TextEditingController();

// GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSubmitted = false;
  int? _selectedOption;
  final ValueNotifier<String?> selectedFolderPathD =
      ValueNotifier<String?>(null);
  final ValueNotifier<String?> selectedFolderPathP =
      ValueNotifier<String?>(null);
  final ValueNotifier<String?> selectedFolderPathA =
      ValueNotifier<String?>(null);

  void _pickFileD() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    print(result.files.first.name);
    print(result.files.first.size);
    print(result.files.first.path);
    final path = await result.files.first.name;
    selectedFolderPathD.value = path;
  }

  void _pickFileP() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    print(result.files.first.name);
    print(result.files.first.size);
    print(result.files.first.path);
    final path = await result.files.first.name;

    selectedFolderPathP.value = path;
  }

  void _pickFileA() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    print(result.files.first.name);
    print(result.files.first.size);
    print(result.files.first.path);
    final path = await result.files.first.name;

    selectedFolderPathA.value = path;
  }

  bool _validateInputs() {
    return _controller.text.isNotEmpty &&
        _controllerP.text.isNotEmpty &&
        selectedFolderPathD.value != null &&
        selectedFolderPathP.value != null &&
        selectedFolderPathA.value != null &&
        _selectedOption != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Are you RCI registered ?",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: 0,
                  groupValue: _selectedOption,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedOption = value;
                      //   d = false;
                      print("yes"); // Update selected value
                    });
                  },
                ),
                Text(
                  "Yes",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 12,
                ),
                Radio(
                  value: 1,
                  groupValue: _selectedOption,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedOption = value;
                      //  d = false;
                      print("No"); // Update selected value
                    });
                  },
                ),
                Text(
                  "No",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Text(
            "Provide RCI licence no.",
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
            "Upload Degree and Certificate",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 15),
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: _isSubmitted && selectedFolderPathD.value == null
                      ? Colors.red
                      : Colors.grey,
                )),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    width: 250,
                    child: ValueListenableBuilder<String?>(
                        valueListenable: selectedFolderPathD,
                        builder: (context, value, child) {
                          return Text(
                            value ?? '',
                            overflow: TextOverflow.ellipsis,
                          );
                        }),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => {_pickFileD()},
                  child: Container(
                    height: 45,
                    width: 50,
                    color: Colors.grey,
                    child: SvgPicture.asset("assets/images/upload.svg"),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "If you practitioner upload certificate",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(top: 10, bottom: 15),
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: _isSubmitted && selectedFolderPathP.value == null
                      ? Colors.red
                      : Colors.grey,
                )),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  width: 250,
                  child: ValueListenableBuilder<String?>(
                      valueListenable: selectedFolderPathP,
                      builder: (context, value, child) {
                        return Text(
                          value ?? '',
                          overflow: TextOverflow.ellipsis,
                        );
                      }),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => {_pickFileP()},
                child: Container(
                  height: 45,
                  width: 50,
                  color: Colors.grey,
                  child: SvgPicture.asset("assets/images/upload.svg"),
                ),
              ),
            ]),
          ),
          Text(
            "Past Work experience deatils",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 10),
            child: TextField(
              controller: _controller,
              maxLines: 5,
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
            "Upload Adhaar Card",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(top: 10, bottom: 15),
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: _isSubmitted && selectedFolderPathA.value == null
                      ? Colors.red
                      : Colors.grey,
                )),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  width: 250,
                  child: ValueListenableBuilder<String?>(
                      valueListenable: selectedFolderPathA,
                      builder: (context, value, child) {
                        return Text(
                          value ?? '',
                          overflow: TextOverflow.ellipsis,
                        );
                      }),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => {_pickFileA()},
                child: Container(
                  height: 45,
                  width: 50,
                  color: Colors.grey,
                  child: SvgPicture.asset("assets/images/upload.svg"),
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => widget.onTap(1),
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

                    if (_controller.text.isNotEmpty &&
                        _controllerP.text.isNotEmpty &&
                        _validateInputs()) {
                      setState(() {
                        widget.onTap(3);
                      });
                      // Navigate to the next screen
                    }

                    if (_selectedOption == null) {
                      CustomSanckbar.showSnackbar(
                          context, "Please select an option");
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
