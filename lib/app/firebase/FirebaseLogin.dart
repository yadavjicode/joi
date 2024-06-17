import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:joi/app/doctor/dashboard/DoctorDashboard.dart';
import 'package:joi/app/firebase/FirebaseDatabase.dart';
import 'package:joi/app/geolocator/GeolocatorPolyline.dart';

import 'package:joi/app/geolocator/GeolocatorWidget.dart';

class PhoneOTPVerification extends StatefulWidget {
  const PhoneOTPVerification({Key? key}) : super(key: key);

  @override
  State<PhoneOTPVerification> createState() => _PhoneOTPVerificationState();
}

class _PhoneOTPVerificationState extends State<PhoneOTPVerification> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  bool visible = false;
  String? verificationId;
  ConfirmationResult? confirmationResult;

  @override
  void dispose() {
    phoneNumber.dispose();
    otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Phone OTP Authentication"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputTextField("Contact Number", phoneNumber, context),
            visible ? inputTextField("OTP", otp, context) : SizedBox(),
            !visible ? SendOTPButton("Send OTP") : SubmitOTPButton("Submit"),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FirebaseDatabase(),
                          ))
                    },
                child: Text("Database")),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()))
                    },
                child: Text("Current Location")),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeolocatorPolyline()))
                    },
                child: Text("Current Location with polyline"))
          ],
        ),
      ),
    );
  }

  Widget SendOTPButton(String text) => ElevatedButton(
        onPressed: () async {
          if (kIsWeb) {
            // Web-specific OTP sending
            confirmationResult =
                await FirebaseAuthentication().sendOTPWeb(phoneNumber.text);
            if (confirmationResult != null) {
              setState(() {
                visible = true;
              });
            } else {
              // Handle error: OTP not sent
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Failed to send OTP. Please try again.')),
              );
            }
          } else {
            // Mobile-specific OTP sending
            await FirebaseAuthentication().sendOTPMobile(
              phoneNumber.text,
              onCodeSent: (String verificationId) {
                setState(() {
                  this.verificationId = verificationId;
                  visible = true;
                });
              },
              onAutoRetrieve: (PhoneAuthCredential credential) async {
                // Auto-retrieve OTP
                await FirebaseAuthentication()
                    .authenticateMobileCredential(credential);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorDashboard(),
                  ),
                );
              },
            );
          }
        },
        child: Text(text),
      );

  Widget SubmitOTPButton(String text) => ElevatedButton(
        onPressed: () async {
          if (kIsWeb) {
            if (confirmationResult != null) {
              bool success = await FirebaseAuthentication()
                  .authenticateWeb(confirmationResult!, otp.text);
              if (success) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorDashboard(),
                  ),
                );
              } else {
                // Handle error: Authentication failed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('Authentication failed. Please try again.')),
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
                  .authenticateMobile(verificationId!, otp.text);
              if (success) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorDashboard(),
                  ),
                );
              } else {
                // Handle error: Authentication failed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('Authentication failed. Please try again.')),
                );
              }
            } else {
              // Handle error: Verification ID is null
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please request OTP first.')),
              );
            }
          }
        },
        child: Text(text),
      );

  Widget inputTextField(String labelText,
          TextEditingController textEditingController, BuildContext context) =>
      Padding(
        padding: EdgeInsets.all(10.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextFormField(
            obscureText: labelText == "OTP" ? true : false,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: labelText,
              hintStyle: TextStyle(color: Colors.blue),
              filled: true,
              fillColor: Colors.blue[100],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5.5),
              ),
            ),
          ),
        ),
      );
}

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
