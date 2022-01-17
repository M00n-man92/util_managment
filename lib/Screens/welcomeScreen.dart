import 'package:crud1/button.dart';
import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'registrationcreen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 60.0,
                ),
                Text(
                  'Hulum Admin',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: PressedBut('Log In', Colors.lightBlueAccent, () {
                  Navigator.pushNamed(context, LoginScreen.id);
                })),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: PressedBut('Register', Colors.blueAccent, () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                })),
          ],
        ),
      ),
    );
  }
}
