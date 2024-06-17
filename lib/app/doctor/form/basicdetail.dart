import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joi/app/util/custom/customsnackbar/CustomSnackbar.dart';

class BasicDetail extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  // BasicDetail({required this.currentIndex, required this.onTap});
  const BasicDetail(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  State<BasicDetail> createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {
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

  final List<String> countries = [
    'India',
    'United States',
    'Canada',
    'Australia',
    'United Kingdom',
    'Germany',
    'France',
    'Japan',
    'China',
    'Russia',
  ];

  //List<bool> isSelected = List.generate(10, (index) => false);
  List<bool> isSelected = List.generate(10, (index) => index == 0);
  bool _isSubmitted = false;
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _mobilenoController = TextEditingController();
  final TextEditingController _emailIdController = TextEditingController();
  // final TextEditingController _profilePicController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  final ValueNotifier<String?> selectedFolderPath =
      ValueNotifier<String?>(null);

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    print(result.files.first.name);
    print(result.files.first.size);
    print(result.files.first.path);
    final path = await result.files.first.name;
    selectedFolderPath.value = path;
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _mobilenoController.dispose();
    _emailIdController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  bool _allFieldsFilled() {
    return _namecontroller.text.isNotEmpty &&
        _mobilenoController.text.isNotEmpty &&
        _mobilenoController.text.length == 10 &&
        _emailIdController.text.isNotEmpty &&
        selectedFolderPath.value != null &&
        _countryController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _pincodeController.text.isNotEmpty &&
        (a == true || b == true || c == true);
  }

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

  bool a = false;
  bool b = false;
  bool c = false;
  // bool language = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 10),
            child: TextField(
              controller: _namecontroller,
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
                errorText: _isSubmitted && _namecontroller.text.isEmpty
                    ? 'Please fill name'
                    : null,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mobile Number",
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      height: 68,
                      width: 150,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        controller: _mobilenoController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
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
                          errorText: _isSubmitted &&
                                      _mobilenoController.text.isEmpty ||
                                  _mobilenoController.text.length != 10
                              ? 'Please fill mobile no'
                              : null,
                        ),
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email ID",
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      height: 68,
                      width: 160,
                      child: TextField(
                        controller: _emailIdController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
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
                          errorText:
                              _isSubmitted && _emailIdController.text.isEmpty
                                  ? 'Please fill email id'
                                  : null,
                        ),
                      )),
                ],
              )
            ],
          ),
          Text(
            "Upload Profile Pic",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 15),
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: _isSubmitted && selectedFolderPath.value == null
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
                        valueListenable: selectedFolderPath,
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
                  onTap: () => {_pickFile()},
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
            "Gender",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => {
                    if (a == false)
                      {
                        setState(() {
                          a = true;
                          b = false;
                          c = false; // Set to true when this container is tapped
                        })
                      }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 28, right: 28, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        color: a ? Colors.grey : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey)),
                    child: Text("Male"),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    if (b == false)
                      {
                        setState(() {
                          b = true;
                          a = false;
                          c = false; // Set to true when this container is tapped
                        })
                      }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 28, right: 28, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        color: b ? Colors.grey : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey)),
                    child: Text("Female"),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    if (c == false)
                      {
                        setState(() {
                          c = true;
                          a = false;
                          b = false; // Set to true when this container is tapped
                        })
                      }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 28, right: 28, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        color: c ? Colors.grey : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey)),
                    child: Text("Other"),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Country",
            style: TextStyle(fontSize: 18),
          ),
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              height: 68,
              child: DropdownButtonFormField<String>(
                // controller: _countryController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                  errorText: _isSubmitted && _countryController.text.isEmpty
                      ? 'Please provide a value'
                      : null,
                ),
                items: countries
                    .map((country) => DropdownMenuItem<String>(
                          value: country,
                          child: Text(country),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _countryController.text = value!;
                  });
                },
              )),
          Text(
            "City",
            style: TextStyle(fontSize: 18),
          ),
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              height: 68,
              child: TextField(
                controller: _cityController,
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
                  errorText: _isSubmitted && _cityController.text.isEmpty
                      ? 'Please provide a value'
                      : null,
                ),
              )),
          Text(
            "Pincode",
            style: TextStyle(fontSize: 18),
          ),
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              height: 68,
              child: TextField(
                controller: _pincodeController,
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
                  errorText: _isSubmitted && _pincodeController.text.isEmpty
                      ? 'Please provide a value'
                      : null,
                ),
              )),
          Text(
            "Languages Known",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            //  margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            height: 250,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns in the grid
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0, // Spacing between rows
                childAspectRatio: 16 / 7,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      var value = items[index];
                      if (isSelected[index] == false) {
                        isSelected[index] = true;
                        for (int i = 0; i < isSelected.length; i++) {
                          if (i != index) {
                            isSelected[i] = false;
                          }
                        }
                      } else {
                        // for (int i = 0; i < isSelected.length; i++) {
                        //   if (i != index) {
                        //     isSelected[i] = false;
                        //   }
                        // }
                        // isSelected[index] = true;
                        // Select the new item
                      }

                      print("value=$value$index}");
                    });
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: isSelected[index]
                            ? Color(0xFFFBFFD1)
                            : Colors.white,
                        border: Border.all(
                            color: isSelected[index]
                                ? Colors.green
                                : Colors.black),
                        // Black border

                        borderRadius: BorderRadius.all(Radius.circular(5))),
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
          GestureDetector(
            onTap: () => {
              setState(() {
                _isSubmitted = true;
              }),
              if (_allFieldsFilled()) {widget.onTap(1)},
              if (a == false && b == false && c == false)
                {CustomSanckbar.showSnackbar(context, "Please select gender")}
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                  color: Color(0xFF7EA11C),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Text(
                "Submit & Next",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
