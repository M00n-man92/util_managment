/* import 'dart:isolate';

import 'package:crud1/Screens/adminScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:crud1/Screens/adminScreen.dart';

class Authservice {
  final FirebaseAuth _firebaseAuth;
  Stream <User> get statechanges=> _firebaseAuth.authStateChanges();
  Authservice(this._firebaseAuth);
  Future<void> Signin({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
     Navigator.pushNamed(context, Admin_Screen.id);
    } on FirebaseAuthException catch (e) {
      print('there app')

    }
  }
}
 */