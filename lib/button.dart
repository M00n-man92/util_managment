import 'package:flutter/material.dart';

class PressedBut extends StatelessWidget {
  final Function onpressed;
  final String title;
  final Color coluor;
  PressedBut(this.title, this.coluor, this.onpressed);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: coluor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onpressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
//
//
//
