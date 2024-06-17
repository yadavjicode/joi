import 'package:flutter/material.dart';
import 'dart:async';

import 'package:joi/app/user/splash/SplashScreenB.dart';

class SplashScreenA extends StatefulWidget {
  const SplashScreenA({super.key});

  @override
  State<SplashScreenA> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenA> {
  @override
  void initState() {
    super.initState();
    // Navigate to the third screen after 3 seconds
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SplashScreenB()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/screen.png'), // Background image
              fit: BoxFit.cover, // Cover the entire container
            ),
            borderRadius:
                BorderRadius.circular(20), // Optional: rounded corners
          ),
          child: Center(
            child: Text(
              'We care for you',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
