import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'adminScreen.dart';
import 'package:crud1/constants/constant.dart';

import 'package:crud1/Screens/deletedio.dart';

class Delete extends StatefulWidget {
  static String id = 'delete_screen';
  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  static String name;
  static int id;

  static double price;
  static double discount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
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
            child: Containerr(Colors.brown, 40, 500, 'Delete Product', 20)),
        titleSpacing: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 5),
              child: RawMaterialButton(
                onLongPress: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                constraints: BoxConstraints.expand(height: 50, width: 50),
                child: CircleAvatar(
                  radius: 29,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
      body: SafeArea(
        child: ListView(children: [
          SizedBoss(0, 100),
          AddThings(
            'Name',
            (value) async {
              name = await value;
            },
            'Delete Product  ',
          ),
          SizedBoss(0, 10),

          /*  AddThings('Purpose', (value) async {
            purpose = await value;
        }, 'Office, Home, School, Hospital, Kitchen'), */

          SizedBoss(0, 10),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: RawMaterialButton(
                onPressed: () async {
                  try {
                    Response<Map> res = await toService().sendPost(name);
                    Map responseBody = res.data;
                    
                    /*  if (res.data.status == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(" Saved "),
                        backgroundColor: Colors.green,
                      )); */

                    // print(res.status);

                    /*  if (res.data.status == 201) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Failed"), backgroundColor: Colors.red)); 
                    }*/

                    //  print(res.ValidationError);
                  } catch (e) {
                    print("there was some issues on$e");
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Failed because $e")));
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                fillColor: Colors.white38,
                constraints: BoxConstraints.expand(width: 50, height: 45),
                child: Icon(Icons.delete)),
          ))
        ]),
      ),
    );
  }
}

class AddThings extends StatelessWidget {
  final String name;
  final Function onpressed;
  final int price;
  final String hint;
  final Color color;
  AddThings(this.name, this.onpressed, [this.hint, this.color, this.price]);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 5,
        ),
        child: Row(
          children: <Widget>[
            Containerr(Colors.white24, 45, 60, name, 11, color, price),
            SizedBoss(10, 0),
            Flexible(
                child: TextField(
              onChanged: onpressed,
              style: TextStyle(color: Colors.white24),
              textAlign: TextAlign.center,
              decoration: kdecorations.copyWith(
                hintText: hint,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white38, width: 2.0),
                ),
              ),
            ))
          ],
        ));
  }
}
