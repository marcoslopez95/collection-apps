import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prokit_flutter/src/Model/UserAuth.dart';

class Helper{
  final storage = const FlutterSecureStorage();

    Future<UserAuth> getUserAuth() async {
      print('--- usuario1 ----');
      String userString = await storage.read(key: 'user') ?? '{}';
      print(userString);
      var user = jsonDecode(userString) ;
      print('--- usuario ----');
      print(user);
      print('--- end usuario ----');
      return UserAuth(name: user['name']);
    }
}