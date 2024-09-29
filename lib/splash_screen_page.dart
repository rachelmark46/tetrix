//Black screen that appears as soon as user opens the app with the logo

import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  SplashScreenPageState createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage> {

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => GamePage()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo image
            Image.asset(
              'assets/PuzzelPixelStudioLaunch.png',
              width: 200, // Adjust width as needed
            ),
            SizedBox(height: 24),
                    Text(
                      '\nTETRIX ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    ),
            SizedBox(height: 20), // Spacer
            // Loading text
            Text(
              'Rachel Mark',
              style: TextStyle(color: Colors.white),
            ),Text(
              'www.ppixel.org',
              style: TextStyle(color: Colors.pink),
            )
          ],
        ),
      ),
    );
  }
 }