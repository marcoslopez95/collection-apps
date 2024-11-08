import 'dart:convert';

import 'package:access_maketicket/constants.dart';
import 'package:access_maketicket/src/Model/ProfileService/QrScans.dart';
import 'package:access_maketicket/src/Services/BaseService.dart';
import 'package:http/http.dart' as http;

class ProfileService extends BaseService
{
  Future<List<QrScans>> getTotalScans() async{
    String url = '${BASE_URL}/qr-scans';

    final Map<String, String> headers = await getHeaders();
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final List<Map<String,dynamic>> jsonResponse = (jsonDecode(response.body) as List<dynamic>).map((el) => el as Map<String,dynamic>).toList();

    return jsonResponse.map((i) => QrScans.fromJson(i)).toList();
  }
}