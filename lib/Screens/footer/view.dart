import 'package:flutter/material.dart';
import 'package:crud1/Screens/adminScreen.dart';
import 'package:crud1/constants/constant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class View_Items extends StatefulWidget {
  static String id = 'view_items_Screens';

  @override
  _View_ItemsState createState() => _View_ItemsState();
}

class _View_ItemsState extends State<View_Items> {
  FirebaseFirestore _firestor = FirebaseFirestore.instance;
  Future<void> downloadStorage() async {
    String downloaded = await firebase_storage.FirebaseStorage.instance
        .ref('images/')
        .getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
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
            child: Containerr(Colors.red, 40, 500, 'View Items', 20)),
        titleSpacing: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 5),
              child: CircleAvatar(
                radius: 29,
                backgroundColor: Colors.white24,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: SafeArea(
          child: StreamBuilder(
              stream: _firestor.collection('furr').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView(
                    children: snapshot.data.docs.map((document) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        RawMaterialButton(
                          onLongPress: () {},
                          onPressed: () {},
                          constraints:
                              BoxConstraints(maxHeight: 50, maxWidth: 200),
                          fillColor: Colors.amber,
                          focusColor: Colors.amber.shade200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Container(
                              constraints: BoxConstraints(),
                              child: Center(
                                child: Text(' ' + document['name'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          child: Text(document['discription'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ]);
                }).toList());
              })),
    );
  }
}
