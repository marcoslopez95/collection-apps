import 'package:access_maketicket/defaultTheme/screen/DTSignUpScreen.dart';
import 'package:access_maketicket/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseService {
  Helper helper = Helper();

  Future<Map<String, String>> getHeaders() async {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await helper.getToken()}',
      'X-Requested-With': 'XMLHttpRequest'
    };
  }
  Future<void> removePermission()async {
    await helper.storage.delete(key: 'token');
  }

  Future<void> goLogin()async{
    await removePermission();
    Navigator.pushReplacement(
      helper.context,
      MaterialPageRoute(builder: (context) => DTSignUpScreen()),
    );
  }
}
