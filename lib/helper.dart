import 'dart:convert';

import 'package:access_maketicket/defaultTheme/screen/DTSignUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:access_maketicket/src/Model/Event.dart';
import 'package:access_maketicket/src/Model/UserAuth.dart';

class Helper
{

  static Helper? _instance;

  Helper._();

  factory Helper() => _instance ??= Helper._();

  late BuildContext context;
  late UserAuth userAuth;
  late Event? event = null;
  late List<Event> events = [];
  final storage = const FlutterSecureStorage();

  Future<UserAuth> getUserAuth() async {
    print('--- usuario1 ----');
    String userString = await storage.read(key: 'user') ?? '{}';
    print(userString);
    var user = jsonDecode(userString) ;
    print('--- usuario ----');
    print(user);
    print('--- end usuario ----');
    this.userAuth = UserAuth.fromJson(user);
    return this.userAuth;
  }

  Future<String?> getToken() async{
    return await storage.read(key: 'token');
  }

  Future<void> removePermission()async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'user');
  }

  Future<void> goLogin()async{
    await removePermission();
    Navigator.pushNamedAndRemoveUntil(
      this.context,
      '/',
      (route) => false,
    );
  }
}