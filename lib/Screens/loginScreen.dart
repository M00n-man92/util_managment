import 'dart:convert';
import 'package:crud1/auth/security.dart';
import 'package:crud1/Screens/adminScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:crud1/constants/constant.dart';
import 'package:crud1/button.dart';
import 'adminScreen.dart';
import 'package:crud1/Screens/logindio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _auth = FirebaseAuth.instance;
  final globalkey = GlobalKey<FormState>();
  bool smtn = true;
  bool vis = true;
  String email, password;
  final _storage = FlutterSecureStorage();
  final _id = FlutterSecureStorage();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: globalkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 48.0,
              ),
              TextFormField(
                  validator: (value) {
                    if (!value.contains('@')) {
                      return "Email is invalid";
                    }
                    if (value.isEmpty) {
                      return "Email must be filled";
                    }
                    return null;
                  },
                  controller: _usernameController,
                  textAlign: TextAlign.center,
                  onChanged: (value) async {
                    email = await value;
                  },
                  decoration:
                      kdecorations.copyWith(hintText: 'Enter your email')),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  controller: _passwordController,
                  textAlign: TextAlign.center,
                  obscureText: vis,
                  onChanged: (value) async {
                    password = await value;
                  },
                  //errorText: validatePassword(_passwordController.text),,
                  validator: (value) {
                    if (!(value.length > 8) && value.isNotEmpty) {
                      return "Password should contain more than 5 characters";
                    }
                    if (value.isEmpty) {
                      return "Password must be filled";
                    }
                    return null;
                  },
                  decoration: kdecorations.copyWith(
                      hintText: 'enter yourpassword',
                      helperText: 'Password should be>=8',
                      suffixIcon: IconButton(
                          icon: Icon(
                              vis ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              vis = !vis;
                            });
                          }))),
              SizedBox(
                height: 24.0,
              ),
              InkWell(
                onTap: () {
                  if (globalkey.currentState.validate()) {
                    print('validated');
                  }
                },
                child: PressedBut('Log In', Colors.lightBlueAccent, () async {
                  try {
                    var email = _usernameController.text;
                    var password = _passwordController.text;

                    Response<Map> res =
                        await AuthService().sendPost(email, password);
                    Map responseBody = res.data;

                    // Map<String, dynamic> ol = json.decode(res{"token"});
                    //  print(responseBody['token']);
                    Map home = responseBody['data'];
                    Map life = home['user'];
                    var userId = life['_id'];

                    //print(userId);
                    // print(responseBody['data':{['_id']}]);
                    String ii = responseBody['status'];
                    var token = responseBody['token'];
                    print(ii);
                    if (ii == 'success') {
                      print(responseBody);

                      //  await storage.write(key: '_id', value: userId);
                      Lokee().security(userId);
                      Lokee().securitytoken(token);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login success")));
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Admin_Screen()),
                          (route) => false);
                    }
                    /* await _storage.write(
                        key: 'token', value: responseBody['token']);
                    print(responseBody);
                    await _id.write(key: 'id', value: userId);
                    print("login sucess");
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Login success")));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Admin_Screen()),
                        (route) => false); */
                    else {
                      print(
                          "there was some issues on logging in please check if email and password are correct");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "there was some issues on logging in please check if email and password are correct")));
                    }
                  } catch (e) {
                    print("there was some issues on$e");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "there was some issues on logging in please check if email and password are correct")));
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
//
