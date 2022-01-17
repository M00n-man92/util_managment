import 'package:flutter/material.dart';
import 'package:crud1/Screens/registrationcreen.dart';
import 'package:crud1/Screens/adminScreen.dart';

class Signout extends StatelessWidget {
  static String id = 'Signout_screen';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Signout'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
            child: Text('Press to signout')),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Admin_Screen.id);
            },
            child: Text('return'))
      ],
    );
  }
}
