import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Lokee {
  FlutterSecureStorage storage = FlutterSecureStorage();
  String name = '';
  Future security(id) async {
    await storage.write(key: '_id', value: id);
  }

  Future securitytoken(id) async {
    await storage.write(key: 'token', value: id);
  }

  Future readSecurity() async {
    var smtn = await storage.read(key: '_id');
    return smtn;
  }

  Future readtoken() async {
    var smtn = await storage.read(key: 'token');
    return smtn;
  }
}
