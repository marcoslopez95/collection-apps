import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prokit_flutter/constants.dart';
import 'package:http/http.dart' as http;
import 'package:prokit_flutter/helper.dart';

class MacketicketService {
  Helper helper = Helper();
  Future<Map<String, dynamic>> scanUuid(String uuid, {bool isConfirm = false}) async{
    String url = '${BASE_URL}/events/accept-ticket/${uuid}?is_confirm=${isConfirm ? 1 : 0}';

    final  Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await helper.getToken()}',
      'X-Requested-With': 'XMLHttpRequest'
    };

    print('---- headers ----');
    print(headers);
    print(Uri.parse(url));
    print('---- end headers ----');
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    print('---- res ----');
    print(response.statusCode);
    print(response.body);
    print('---- end res ----');
    final jsonResponse = jsonDecode(response.body);
    print('---- scaneando ----');
    print(jsonResponse);
    print('---- end scaneando ----');
    return jsonResponse;
  }
}