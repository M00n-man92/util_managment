import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'adminScreen.dart';
import 'package:crud1/constants/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import 'package:crud1/Screens/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crud1/Screens/logout.dart';
import 'package:crud1/auth/security.dart';

class Products extends StatefulWidget {
  static String id = 'products_screen';
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  static String name, trainee;
  static String discription;
  static double price;
  static String purpose, type;

  String downUrl;
  File _image;
  XFile pickedFile;
  final picker = ImagePicker();

  Future<void> setdata() async {}

  Future getImagefromGallery() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        var image = _image;
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImagefromCamera() async {
    final picked_File = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (picked_File != null || picked_File != null) {
        _image = File(picked_File.path);
        print(_image);
      } else {
        print('No Pics Taken.');
      }
    });
  }

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
            child: Containerr(Colors.brown, 40, 500, 'Create Product', 20)),
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
          child: ListView(children: [
        SizedBoss(
          290,
          10,
        ),
        SizedBoss(
          0,
          20,
        ),
        AddThings(
          'Name',
          (value) async {
            name = await value;
          },
          'Product Name',
        ),
        SizedBoss(0, 10),
        AddThings('Discription', (value) async {
          discription = await value;
        }, 'Product Discription'),
        SizedBoss(0, 10),
        Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 5,
            ),
            child: Row(
              children: <Widget>[
                Containerr(Colors.white24, 45, 60, 'Price', 11, Colors.black),
                SizedBoss(10, 0),
                Flexible(
                    child: TextField(
                  onChanged: (val) async {
                    price = await double.parse(val);
                  },
                  style: TextStyle(color: Colors.white24),
                  textAlign: TextAlign.center,
                  decoration: kdecorations.copyWith(
                    hintText: 'Price in Amount',
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
            )),
        SizedBoss(0, 10),
/*         Container(
          child: DropdownButton(
            menuMaxHeight: 29,
            isExpanded: true,
            onChanged: (value) async {
              purpose = await value;
            },
            items: <String>['Office', 'Kitchen', 'Home', 'School', 'Hospital']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ), */
        AddThings('Purpose', (value) async {
          purpose = await value;
        }, 'Office, Home, School, Hospital, Kitchen'),
        SizedBoss(0, 10),
        AddThings('Type', (value) async {
          type = await value;
        }, 'Brand New, Like New'),
        SizedBoss(0, 10),
        Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 5,
          ),
          child: Row(children: <Widget>[
            RawMaterialButton(
              onPressed: () => getImagefromGallery(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              fillColor: Colors.white38,
              constraints: BoxConstraints.expand(width: 50, height: 45),
              child: Icon(Icons.attach_file),
            ),

            /* butn(Icon(Icons.ac_unit), 'Press me', () => getImage(), 50, 45,
                    Colors.white38),
         */
            SizedBoss(20, 20),
            Flexible(
                child: _image != null
                    ? Image.file(
                        _image,
                        fit: BoxFit.scaleDown,
                        width: 50,
                        height: 45,
                      )
                    : Text(
                        'no Image',
                        style: TextStyle(color: Colors.white38),
                      )),
            SizedBoss(62, 5),
            Flexible(
              child: RawMaterialButton(
                onPressed: () => getImagefromCamera(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                fillColor: Colors.white38,
                constraints: BoxConstraints.expand(width: 50, height: 45),
                child: Icon(Icons.camera_alt),
              ),
            ),
            SizedBoss(20, 10),
            Flexible(
                child: _image != null
                    ? Image.file(
                        _image,
                        fit: BoxFit.scaleDown,
                        width: 50,
                        height: 45,
                      )
                    : Text(
                        'no Image',
                        style: TextStyle(color: Colors.white38),
                      )),
          ]),
        ),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: RawMaterialButton(
              onPressed: () async {
                try {
                  /*  var go = basename(_image.path);
                  String file = go.toString(); */
                  var securityid = await Lokee().readSecurity();
                  Response<Map> respo = await Service().sendLocation();
                  Map location = respo.data;

                  var loc = location['location'];
                  dynamic long = loc['longitude'];
                  dynamic lat = loc['latitude'];
                  print({long, lat});

                  print({name, price, type, discription});
                  Response<Map> resp = await Service().sendPost(
                      name, type, purpose, price, discription, lat, long);
                  print(resp);
                  Map responseBody = resp.data;
                  var status = responseBody['status'];

                  if (status == "success") {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Product Added successfully")));
                    if (_image != null) {
                      await Service().sendImage(name, _image.path);

                      /* String fileName = _image.path.split('/').last;
                      FormData formData = new FormData.fromMap({
                        "file": await MultipartFile.fromFile(_image.path,
                            filename: fileName), 
                      });
                      await Service().sendImage(name, formData,_image);
                    } */
                    }
                    print(status);
                  }
                  // var poland = await Service().writeLocation(long, lat, name);
                  /*   Map responseBody = res.data;
                  print(responseBody); */
                  /*  if (res.data.status == 'success') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(" Saved "),
                      backgroundColor: Colors.green,
                    )); */

                  // print(res);

                  /*  if (res.data.status == 201) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Failed"), backgroundColor: Colors.red)); 
                  }*/

                  //  print(res.ValidationError);

                } catch (e) {
                  print("there was some issues on$e");
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Product Name already Taken")));
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              fillColor: Colors.white38,
              constraints: BoxConstraints.expand(width: 50, height: 45),
              child: Icon(Icons.add)),
        ))
      ])),
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
