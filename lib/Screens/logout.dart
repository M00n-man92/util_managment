import 'package:crud1/Screens/adminScreen.dart';
import 'package:crud1/Screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crud1/Screens/loginScreen.dart';

class Logout extends StatefulWidget {
  static String id = 'logout_screen';

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: AlertDialog(
            title: new Text('Logging Out Are We?'),
            actions: <Widget>[
          Row(
            children: <Widget>[
              TextButton(
                child: Text("Leave"),
                onPressed: () {
                  setState(() {
                    storage.delete(key: 'token');
                    storage.delete(key: 'id');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  });
                },
              ),
              Icon(Icons.door_back_door_outlined),
              SizedBoss(30, 0),
              TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Admin_Screen()),
                      (route) => false);
                },
              ),
            ],
          )
        ])
        // set up the buttons

        );
  }
}
