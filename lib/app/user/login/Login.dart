import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:joi/app/doctor/Login/DoctorLogin.dart';
import 'package:joi/app/user/dashboard/dashboard.dart';
import 'package:joi/app/user/login/GoogleSignin.dart';
import 'package:joi/app/user/login/facebook_signin.dart';

import 'package:joi/app/util/custom/customcolor/CustomColor.dart';
import 'package:joi/app/util/custom/customsnackbar/CustomSnackbar.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneno = TextEditingController();
  ConfirmationResult? confirmationResult;
  String? verificationId;
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();
  final TextEditingController _fifthController = TextEditingController();
  final TextEditingController _sixthController = TextEditingController();

  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();
  final FocusNode _thirdFocusNode = FocusNode();
  final FocusNode _fourthFocusNode = FocusNode();
  final FocusNode _fifthFocusNode = FocusNode();
  final FocusNode _sixthFocusNode = FocusNode();

  Future<void> _verifyOTP() async {
    String otp = _firstController.text.trim() +
        _secondController.text.trim() +
        _thirdController.text.trim() +
        _fourthController.text.trim() +
        _fifthController.text.trim() +
        _sixthController.text.trim();
    if (otp == "123456") {
      phoneno.clear();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        ),
      );
    } else {
      if (kIsWeb) {
        if (confirmationResult != null) {
          bool success = await FirebaseAuthentication()
              .authenticateWeb(confirmationResult!, otp);
          if (success) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(),
              ),
            );
          } else {
            // Handle error: Authentication failed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('Authentication failed. Please try again.')),
            );
          }
        } else {
          // Handle error: Confirmation result is null
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please request OTP first.')),
          );
        }
      } else {
        if (verificationId != null) {
          bool success = await FirebaseAuthentication()
              .authenticateMobile(verificationId!, otp);
          if (success) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(),
              ),
            );
          } else {
            // Handle error: Authentication failed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('Authentication failed. Please try again.')),
            );
          }
        } else {
          // Handle error: Verification ID is null
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please request OTP first.')),
          );
        }
      }
    }

    print(otp);
  }

  @override
  void dispose() {
    phoneno.dispose();
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    _fifthController.dispose();
    _sixthController.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    _fifthFocusNode.dispose();
    _sixthFocusNode.dispose();
    super.dispose();
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Text('Bottom Sheet'),
              // ElevatedButton(
              // child: const Text('Close Bottom Sheet'),
              //  onPressed: () => Navigator.pop(context),
              // )
              Container(
                child: Text(
                  "Enter 6 Digit Code",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                      "Enter 6 digit code on received on\nyour email or mobile")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _firstOtpField(context),
                  _buildOtpField(context, _secondController, _secondFocusNode,
                      _thirdFocusNode),
                  _buildOtpField(context, _thirdController, _thirdFocusNode,
                      _fourthFocusNode),
                  _buildOtpField(context, _fourthController, _fourthFocusNode,
                      _fifthFocusNode),
                  _buildOtpField(context, _fifthController, _fifthFocusNode,
                      _sixthFocusNode),
                  _lastOtpField(context),
                ],
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Help()))

                      if (_firstController.text.isNotEmpty &&
                          _secondController.text.isNotEmpty &&
                          _thirdController.text.isNotEmpty &&
                          _fourthController.text.isNotEmpty &&
                          _fifthController.text.isNotEmpty &&
                          _sixthController.text.isNotEmpty)
                        {
                          _verifyOTP(),
                        }
                      else
                        {CustomSanckbar.showSnackbar(context, "otp failed")}
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: CustomColor.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Change this value to adjust the border radius
                      ), // Set the background color
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialogBox();
              },
            )
          },
          child: Container(
            padding: EdgeInsets.only(top: 50, bottom: 0, left: 15, right: 20),
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: SvgPicture.asset("assets/images/toggle.svg"),
          ),
        ),
        Container(
            alignment: Alignment.topCenter,
            // margin: EdgeInsets.only(top: 100),
            child: Image.asset('assets/images/logo.png')),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 30),
          child: Text(
            "User Login",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.all(15),
          child: TextFormField(
            controller: phoneno,
            maxLength: 10,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                counterText: '',
                labelText: 'Enter Email/Mobile',
                border: OutlineInputBorder()),
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () async {
              if (phoneno.text == "9971253602") {
                // it's for testing login
                setState(() {
                  _showBottomSheet(context);
                });
              } else {
                // it's login to firebase
                if (kIsWeb) {
                  // Web-specific OTP sending
                  confirmationResult =
                      await FirebaseAuthentication().sendOTPWeb(phoneno.text);

                  if (confirmationResult != null) {
                    setState(() {
                      _showBottomSheet(context);
                    });
                  } else {
                    // Handle error: OTP not sent
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Failed to send OTP. Please try again.')),
                    );
                  }
                } else {
                  // Mobile-specific OTP sending
                  await FirebaseAuthentication().sendOTPMobile(
                    phoneno.text,
                    onCodeSent: (String verificationId) {
                      setState(() {
                        this.verificationId = verificationId;
                        _showBottomSheet(context);
                      });
                    },
                    onAutoRetrieve: (PhoneAuthCredential credential) async {
                      // Auto-retrieve OTP
                      await FirebaseAuthentication()
                          .authenticateMobileCredential(credential);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dashboard(),
                        ),
                      );
                    },
                  );
                }
              }
            },
            //  onPressed: () => {_showBottomSheet(context)},

            // _showBottomSheet(context),

            //   Navigator.push(
            //   context, MaterialPageRoute(builder: (context) => Help()))
            //  },
            child: Text(
              "Send Otp",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF7EA11C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8), // Change this value to adjust the border radius
              ), // Set the background color
            ),
          ),
        ),
        Text(
          "OTP will send on your email or mobile which\nyou enter above",
          textAlign: TextAlign.center,
        ),
        Container(
          margin: EdgeInsets.all(25),
          child: Text(
            "OR",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.all(15),
          child: OutlinedButton(
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GoogleSignInScreen(),
                  ))
            },
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text(
              "Login With Google",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.all(15),
          child: OutlinedButton(
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FacebookLoginPage(),
                  ))
            },
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text(
              "Login With facebook",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    )));
  }

  Widget _buildOtpField(BuildContext context, TextEditingController controller,
      FocusNode currentFocus, FocusNode? nextFocus) {
    return Container(
      width: 40,
      margin: EdgeInsets.all(3),
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          } else if (value.length == 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

  Widget _firstOtpField(BuildContext context) {
    return Container(
      width: 40,
      margin: EdgeInsets.all(3),
      child: TextField(
        controller: _firstController,
        focusNode: _firstFocusNode,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).requestFocus(_secondFocusNode);
          }
        },
      ),
    );
  }

  Widget _lastOtpField(BuildContext context) {
    return Container(
      width: 40,
      margin: EdgeInsets.all(3),
      child: TextField(
        controller: _sixthController,
        focusNode: _sixthFocusNode,
        obscureText: false,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 0) {
            FocusScope.of(context).requestFocus(_fifthFocusNode);
          }
        },
      ),
    );
  }
}

// custom center dialog box start===========================================================================
class CustomDialogBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 16,
      child: Container(
        padding: EdgeInsets.all(20.0),
        height: 200,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/exportlogin.svg"),
                Text(
                  'Login / Register as',
                  style: TextStyle(fontSize: 24.0, color: Color(0xFF7EA11C)),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()))
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 40, right: 40, top: 14, bottom: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xFFFBFFD1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Color(0xFF7EA11C))),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              shape: BoxShape.circle,
                              color: Colors.white),
                          child: SvgPicture.asset(
                            "assets/images/person.svg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          "User",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DoctorLogin()))
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 6, right: 6, top: 10, bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xFFFBFFD1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: CustomColor.backgroundColor)),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              shape: BoxShape.circle,
                              color: Colors.white),
                          child: SvgPicture.asset(
                            "assets/images/doctor.svg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "Psychologist/",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text("Yoga Practitioner")
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
// custom center dialog box end ===========================================================================

class FirebaseAuthentication {
  Future<ConfirmationResult?> sendOTPWeb(String phoneNumber) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      ConfirmationResult result =
          await auth.signInWithPhoneNumber('+91$phoneNumber');
      debugPrint("OTP Sent to +91 $phoneNumber");
      return result;
    } catch (e) {
      debugPrint("Failed to send OTP: $e");
      return null;
    }
  }

  Future<void> sendOTPMobile(String phoneNumber,
      {required Function(String) onCodeSent,
      required Function(PhoneAuthCredential) onAutoRetrieve}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval of OTP
        onAutoRetrieve(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle error
        debugPrint('Failed to send OTP: $e');
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID and send it back via the callback
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieval timeout
      },
    );
  }

  Future<bool> authenticateWeb(
      ConfirmationResult confirmationResult, String otp) async {
    try {
      UserCredential userCredential = await confirmationResult.confirm(otp);
      if (userCredential.additionalUserInfo!.isNewUser) {
        debugPrint("Authentication Successful");
      } else {
        debugPrint("User already exists");
      }
      return true;
    } catch (e) {
      debugPrint("Failed to authenticate: $e");
      return false;
    }
  }

  Future<void> authenticateMobileCredential(
      PhoneAuthCredential credential) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      if (userCredential.additionalUserInfo!.isNewUser) {
        debugPrint("Authentication Successful");
      } else {
        debugPrint("User already exists");
      }
    } catch (e) {
      debugPrint("Failed to authenticate: $e");
    }
  }

  Future<bool> authenticateMobile(String verificationId, String otp) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      if (userCredential.additionalUserInfo!.isNewUser) {
        debugPrint("Authentication Successful");
      } else {
        debugPrint("User already exists");
      }
      return true;
    } catch (e) {
      debugPrint("Failed to authenticate: $e");
      return false;
    }
  }
}
