import 'package:access_maketicket/defaultTheme/screen/DTSignUpScreen.dart';
import 'package:access_maketicket/helper.dart';
import 'package:access_maketicket/src/Model/Model.dart';
import 'package:flutter/cupertino.dart';
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

class BaseResponse<T extends BaseModel>{
  bool success;
  String message;
  Color color;
  IconData icon;
  T data;

  BaseResponse({
    required this.success,
    required this.message,
    required this.color,
    required this.icon,
    required this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json,T Function(Map<String, dynamic>) fromJsonT)
  {
    return BaseResponse(
        success: json['success'],
        message: json['message'],
        color: Color(int.parse(json['color'])),
        icon: IconData(int.parse(json['icon']),fontFamily: 'MaterialIcons'),
        data: fromJsonT(json['data']),
    );
  }
}