import 'dart:convert';

import 'package:access_maketicket/helper.dart';
import 'package:flutter/material.dart';
import 'package:access_maketicket/constants.dart';
import 'package:http/http.dart' as http;
import 'package:access_maketicket/src/Model/AccessDetail.dart';
import 'package:access_maketicket/src/Model/Event.dart';
import 'package:access_maketicket/src/Services/BaseService.dart';

class MacketicketService extends BaseService {
  Helper helper = Helper();
  Future<Map<String, dynamic>> scanUuid(String uuid, {int? event_id = null}) async {
    String eventsQuery = event_id != null
        ? 'event_id[]=${event_id}'
        : helper.events.map((Event event) => 'event_id[]=${event.id}').join('&');
    String url =
        '${BASE_URL}/events/accept-ticket/${uuid}?${eventsQuery}';

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

  Future<List<AccessDetail>> getAccessDetailByEvent(String event_id) async {
    String url = '${BASE_URL}/events/${event_id}/acces-detail';
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