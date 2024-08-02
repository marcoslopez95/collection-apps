import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prokit_flutter/src/Model/UserAuth.dart';

class Helper extends ChangeNotifier{

  late UserAuth userAuth;

  final storage = const FlutterSecureStorage();

  Future<UserAuth> getUserAuth() async {
    print('--- usuario1 ----');
    String userString = await storage.read(key: 'user') ?? '{}';
    print(userString);
    var user = jsonDecode(userString) ;
    print('--- usuario ----');
    print(user);
    print('--- end usuario ----');
    this.userAuth = UserAuth(name: user['name']);
    return this.userAuth;
  }


}