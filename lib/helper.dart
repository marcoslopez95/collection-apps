import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:access_maketicket/src/Model/Event.dart';
import 'package:access_maketicket/src/Model/UserAuth.dart';

class Helper
{

  static Helper? _instance;

  Helper._();

  factory Helper() => _instance ??= Helper._();

  late UserAuth userAuth;
  late Event? event = null;
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


}