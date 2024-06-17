import 'package:flutter/material.dart';
import 'dart:async';

import 'package:joi/app/user/splash/SplashScreenE.dart';

class SplashScreenD extends StatefulWidget {
  const SplashScreenD({super.key});

  @override
  State<SplashScreenD> createState() => _SplashScreenDState();
}

class _SplashScreenDState extends State<SplashScreenD> {
  @override
  void initState() {
    super.initState();
    // Navigate to the third screen after 3 seconds
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SplashScreenE()),
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
                )),
            Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(
                    "Offering a quick emotional relief\nsession at your convenience,\neasing your day to day worries",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
