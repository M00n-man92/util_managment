import 'package:flutter/material.dart';
import 'package:crud1/Screens/adminScreen.dart';
import 'package:crud1/constants/constant.dart';

class Setting extends StatefulWidget {
  static String id = 'setting_screen';
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return /*  Scaffold(
      backgroundColor: Colors.brown,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Row(children: <Widget>[
              FootButton(() {
                Navigator.pop(context);
              }, Icon(Icons.backspace), 'Back', 40, 40, 5)
            ])),
        title: Padding(
            padding: EdgeInsets.all(10),
            child: Containerr(Colors.red, 40, 500, 'Contact Us', 20)),
        titleSpacing: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 5),
              child: RawMaterialButton(
                constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29)),
                onPressed: () {
                  Navigator.pushNamed(context, Admin_Screen.id);
                },
                child: CircleAvatar(
                  radius: 29,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ))
        ],
      ),
    );
 */
        AlertDialog(
      title: Text('Signout'),
      actions: [
        TextButton(onPressed: () {}, child: Text('Press to signout')),
        TextButton(onPressed: () {}, child: Text('return'))
      ],
    );
  }
}
