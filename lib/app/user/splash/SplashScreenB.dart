import 'package:flutter/material.dart';
import 'package:joi/app/user/splash/SplashScreenC.dart';
import 'dart:async';

class SplashScreenB extends StatefulWidget {
  const SplashScreenB({super.key});

  @override
  State<SplashScreenB> createState() => _SplashScreenBState();
}

class _SplashScreenBState extends State<SplashScreenB> {
  @override
  void initState() {
    super.initState();
    // Navigate to the third screen after 3 seconds
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SplashScreenC()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/screen.png'), // Background image
          fit: BoxFit.cover, // Cover the entire container
        ) // Optional: rounded corners
            ),
        child: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 100),
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
