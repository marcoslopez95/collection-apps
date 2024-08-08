import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prokit_flutter/constants.dart';
import 'package:http/http.dart' as http;
import 'package:prokit_flutter/helper.dart';
import 'package:prokit_flutter/src/Model/AccessDetail.dart';
import 'package:prokit_flutter/src/Model/Event.dart';

class MacketicketService {
  Future<Map<String, String>> getHeaders()async{
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await helper.getToken()}',
      'X-Requested-With': 'XMLHttpRequest'
    };
  }
  Helper helper = Helper();

  Future<Map<String, dynamic>> scanUuid(String uuid, {bool isConfirm = false}) async{
    String url = '${BASE_URL}/events/accept-ticket/${uuid}?is_confirm=${isConfirm ? 1 : 0}';

    final  Map<String, String> headers = await getHeaders();
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  }

  Future<List<Event>> getEvents() async{
    String url = '${BASE_URL}/events';

    final  Map<String, String> headers = await getHeaders();
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final jsonResponse = jsonDecode(response.body);
    final data = jsonResponse['data'] as List<dynamic>;
    return data.map((item) => Event.fromJson(item)).toList();
  }

  Future<List<AccessDetail>> getAccessDetailByEvent(int event_id) async{
    String url = '${BASE_URL}/events/get/Acces/Detail/${event_id}';

    final  Map<String, String> headers = await getHeaders();
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final jsonResponse = jsonDecode(response.body);
    final data = jsonResponse as List<dynamic>;
    return data.map((item) => AccessDetail.fromJson(item)).toList();
  }
}