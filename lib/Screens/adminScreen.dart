import 'package:crud1/Screens/delete.dart';
import 'package:crud1/Screens/footer/contactus.dart';
import 'package:crud1/Screens/loginScreen.dart';
import 'package:crud1/Screens/update.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'product.dart';
import 'package:crud1/Screens/logout.dart';
import 'package:crud1/Screens/delete.dart';

class Admin_Screen extends StatefulWidget {
  static String id = 'admin_screen';
  @override
  _Admin_ScreenState createState() => _Admin_ScreenState();
}

class _Admin_ScreenState extends State<Admin_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Row(children: <Widget>[SizedBoss(40, 40)])),
        title: Padding(
            padding: EdgeInsets.all(10),
            child: Containerr(Colors.brown, 40, 500, 'Hulum Admin', 20)),
        titleSpacing: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 5),
              child: RawMaterialButton(
                onLongPress: () {
                  Navigator.pushNamed(context, Logout.id);

                  //Navigator.pushNamed(context, LogoutScreen());
                },
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBoss(
                290,
                10,
                Divider(
                  color: Colors.white38,
                  height: 10,
                )),
            SizedBoss(
              0,
              30,
              Container(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 5,
              ),
              child: Row(
                children: <Widget>[
                  Butn(
                      Icon(
                        Icons.add,
                        size: 40,
                      ),
                      'New Product', () {
                    Navigator.pushNamed(context, Products.id);
                  }, 90, 90, Colors.white24),
                  SizedBoss(10, 0),
                  Butn(
                      Icon(
                        Icons.edit,
                        size: 40,
                      ),
                      'Update', () {
                    Navigator.pushNamed(context, Update.id);
                  }, 90, 90, Colors.white24),
                  SizedBoss(10, 0),
                  Butn(
                      Icon(
                        Icons.delete,
                        size: 40,
                      ),
                      'Remove', () {
                    Navigator.pushNamed(context, Delete.id);
                  }, 90, 90, Colors.white24),
                ],
              ),
            ),
            // Container(child: _buildList(8)),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              children: <Widget>[
                Container(
                  color: Colors.white38,
                  height: 50,
                  width: 50,
                ),
                SizedBoss(20, 20),
                Container(
                  color: Colors.white38,
                  height: 50,
                  width: 50,
                ),
                SizedBoss(20, 20),

                //content widgets
              ],
            ),

            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 5,
                ),
                child: Row(
                  children: <Widget>[
                    //  Container(width: 60, height: 40, color: Colors.white24),
                    SizedBoss(10, 0),
                    FootButton(() {
                      Navigator.pushNamed(context, ContactUs.id);
                    }, Icon(Icons.message), 'Contact Us', 60, 40, 10),
                    SizedBoss(10, 0),
                    SizedBoss(10, 0),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget remindButton = TextButton(
    child: Text("Remind me later"),
    onPressed: () {},
  );
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {},
  );
  Widget launchButton = TextButton(
    child: Text("Launch missile"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Notice"),
    content: Text(
        "Launching this missile will destroy the entire universe. Is this what you intended to do?"),
    actions: [
      remindButton,
      cancelButton,
      launchButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class Containerr extends StatelessWidget {
  final String textt;
  final int price;
  final Color colourr;
  final double heightt, widthh;
  final double fontsize;
  final Color color;
  Containerr(this.colourr, this.heightt, this.widthh, this.textt, this.fontsize,
      [this.color, this.price]);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: heightt,
        width: widthh,
        color: colourr,
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 8, right: 10),
          child: Text(textt,
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontSize: fontsize)),
        ),
      ),
    );
  }
}

class Butn extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function onpressed;
  final double width, height;
  final Color color;
  Butn(
      [this.icon,
      this.text,
      this.onpressed,
      this.height,
      this.width,
      this.color]);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.circular(20)),
      constraints: BoxConstraints.expand(width: width, height: height),
      //highlightElevation: 0.0,
      onPressed: onpressed,
      fillColor: color,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 2, top: 5), child: icon),
          SizedBox(height: 10),
          Text(
            text,
            //  style: TextStyle(color: Colors.black12, fontSize: 15),
          )
        ],
      ),
    );
  }
}

class FootButton extends StatelessWidget {
  final Function onpressed;
  final Icon icon;
  final String text;
  final double width, lenght, radius;
  FootButton(this.onpressed, this.icon, this.text,
      [this.width, this.lenght, this.radius]);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: Column(
        children: <Widget>[
          icon,
          Text(
            text,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      constraints: BoxConstraints.expand(width: width, height: lenght),
      shape: RoundedRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.circular(radius)),
      fillColor: Colors.white24,
    );
  }
}

class SizedBoss extends StatelessWidget {
  final double widht, length;
  final Widget kid;
  SizedBoss(this.widht, this.length, [this.kid]);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widht,
      height: length,
      child: kid,
    );
  }
}

List _buildList(int count) {
  List<Widget> listItems = List();

  for (int i = 0; i < count; i++) {
    listItems.add(new Padding(
        padding: new EdgeInsets.all(20.0),
        child: new Text('Item ${i.toString()}',
            style: new TextStyle(fontSize: 25.0, color: Colors.white38))));
  }

  return listItems;
}
