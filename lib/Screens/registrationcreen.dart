import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'adminScreen.dart';
import 'package:crud1/button.dart';
import 'package:crud1/constants/constant.dart';
import 'package:crud1/Screens/registerdio.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'regsitration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String passsword, email, name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) async {
                name = await value;
              },
              textAlign: TextAlign.center,
              decoration: kdecorations.copyWith(hintText: 'Enter your name'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) async {
                email = await value;
              },
              textAlign: TextAlign.center,
              decoration: kdecorations.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) async {
                passsword = await value;
              },
              decoration:
                  kdecorations.copyWith(hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            PressedBut(
              'Register',
              Colors.blueAccent,
              () async {
                try {
                  var res =
                      await AuthService().sendPost(name, email, passsword);
                  print(res.data);
                } on DioError catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

//'Enter your password'
