import 'package:flutter/material.dart';
import 'dart:async';

import 'package:joi/app/user/login/Login.dart';

class SplashScreenE extends StatefulWidget {
  const SplashScreenE({super.key});

  @override
  State<SplashScreenE> createState() => _SplashScreenEState();
}

class _SplashScreenEState extends State<SplashScreenE> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Login()),
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
                )),
            Spacer(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () => {},
                child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF7EA11C), // Set the background color
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
