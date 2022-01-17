import 'package:flutter/material.dart';
import 'Screens/welcomeScreen.dart';
import 'Screens/adminScreen.dart';
import 'Screens/loginScreen.dart';
import 'Screens/registrationcreen.dart';
import 'Screens/product.dart';
import 'Screens/footer/contactus.dart';

import 'Screens/logout.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'Screens/update.dart';
import 'Screens/product.dart';
import 'Screens/delete.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(MyApp());
}

Widget SomethingWentWrong() {
  print('somehting wemnt wrioj');
}

class MyApp extends StatefulWidget {
  Future<String> get jwtOrEmpty async {
    final storage = FlutterSecureStorage();
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final storage = FlutterSecureStorage();
  final userIDStorage = FlutterSecureStorage();
  Widget page = LoginScreen();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String token = await storage.read(key: "token");
    String id = await storage.read(key: 'id');
    print(token);
    if (id = null) {
      page = Admin_Screen();
    } else {
      page = RegistrationScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          /*   if (snapshot.hasError) {
           SomethingWentWrong();
        } */
          if (snapshot.connectionState == ConnectionState.done) {
            print('initialized');
            return MaterialApp(
              home: page,
              initialRoute: WelcomeScreen.id,
              routes: {
                Delete.id: (context) => Delete(),
                Update.id: (context) => Update(),
                Logout.id: (context) => Logout(),
                RegistrationScreen.id: (context) => RegistrationScreen(),
                LoginScreen.id: (context) => LoginScreen(),
                RegistrationScreen.id: (context) => RegistrationScreen(),
                Admin_Screen.id: (contex) => Admin_Screen(),
                Products.id: (contex) => Products(),
                ContactUs.id: (context) => ContactUs()
              },
            );
          }
          //make animation while its waitng
          return Center(child: CircularProgressIndicator());
        });
    /*   */
  }
}
