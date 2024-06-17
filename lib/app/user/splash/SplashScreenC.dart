import 'package:flutter/material.dart';
import 'dart:async';

import 'package:joi/app/user/splash/SplashScreenD.dart';

class SplashScreenC extends StatefulWidget {
  const SplashScreenC({super.key});

  @override
  State<SplashScreenC> createState() => _SplashScreenCState();
}

class _SplashScreenCState extends State<SplashScreenC> {
  @override
  void initState() {
    super.initState();
    // Navigate to the third screen after 3 seconds
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SplashScreenD()),
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
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 100),
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 100),
                child: Center(
                  child: Text(
                    "Personalised and\naffordable therapy",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
