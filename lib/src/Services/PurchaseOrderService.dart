import 'dart:convert';

import 'package:access_maketicket/constants.dart';
import 'package:access_maketicket/src/Model/ProfileService/QrScans.dart';
import 'package:access_maketicket/src/Model/PurchaseOrder.dart';
import 'package:access_maketicket/src/Services/BaseService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PurchaseOrderService extends BaseService
{
  Future<PurchaseOrderResult?> getPurchaseOrderByIdOrUuid(int? id, String? uuid) async{

    String url = '${BASE_URL}/purchase-order?id=${id ?? ''}&uuid=${uuid ?? ''}';

    final Map<String, String> headers = await getHeaders();
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if(response.statusCode == 401){
      await goLogin();
      return null;
    }
    if(response.statusCode != 200){
      final jsonResponse = jsonDecode(response.body);
      return PurchaseOrderResult(error: jsonResponse['message']);
    }
    final jsonResponse = jsonDecode(response.body);
    return PurchaseOrderResult(purchaseOrder: PurchaseOrder.fromJson(jsonResponse['data']));
  }
}

class PurchaseOrderResult{
  PurchaseOrder? purchaseOrder;
  String? error;

  PurchaseOrderResult({
    this.purchaseOrder,
    this.error,
  });
}