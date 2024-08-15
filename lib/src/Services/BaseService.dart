import 'package:access_maketicket/helper.dart';

class BaseService{
  Helper helper = Helper();

    Future<Map<String, String>> getHeaders() async {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${await helper.getToken()}',
      'X-Requested-With': 'XMLHttpRequest'
    };
  }
}