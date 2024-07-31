// lib/services/api_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prokit_flutter/constants.dart';

class LoginController {
  final String baseUrl = BASE_URL;
  final storage = const FlutterSecureStorage();

  Future<bool> login(String email, String password) async {
    print('Iniciando sesión con: $email');
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      await storage.write(key: 'token', value: jsonResponse['token']);
      print('-----attributes----');
      print(jsonResponse['data']['attributes']);
      print('-----end attributes----');
      await storage.write(key: 'user', value: jsonEncode(jsonResponse['data']['attributes']));

      return true;
    } else {
      return false;
    }
  }
}
