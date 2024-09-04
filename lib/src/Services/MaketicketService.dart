import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:access_maketicket/constants.dart';
import 'package:http/http.dart' as http;
import 'package:access_maketicket/src/Model/AccessDetail.dart';
import 'package:access_maketicket/src/Model/Event.dart';
import 'package:access_maketicket/src/Services/BaseService.dart';

class MacketicketService extends BaseService {

  Future<Map<String, dynamic>> scanUuid(String uuid) async {
    String url =
        '${BASE_URL}/events/accept-ticket/${uuid}';

    final Map<String, String> headers = await getHeaders();
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  }

  Future<List<Event>> getEvents() async {
    String url = '${BASE_URL}/events';

    final Map<String, String> headers = await getHeaders();
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final jsonResponse = jsonDecode(response.body);
    final data = jsonResponse['data'] as List<dynamic>;
    return data.map((item) => Event.fromJson(item)).toList();
  }

  // En ./src/makeservice
  Future<List<Event>> getEventsSearch({String query = ''}) async {
    String url = '${BASE_URL}/events?name=$query';
    print('url: ${url}');
    final Map<String, String> headers = await getHeaders();
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    final jsonResponse = jsonDecode(response.body);
    final data = jsonResponse['data'] as List<dynamic>;
    return data.map((item) => Event.fromJson(item)).toList();
  }

  Future<List<AccessDetail>> getAccessDetailByEvent(int event_id) async {
    String url = '${BASE_URL}/events/get/Acces/Detail/${event_id}';

    final Map<String, String> headers = await getHeaders();
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final jsonResponse = jsonDecode(response.body);
    final data = jsonResponse as List<dynamic>;
    return data.map((item) => AccessDetail.fromJson(item)).toList();
  }
}