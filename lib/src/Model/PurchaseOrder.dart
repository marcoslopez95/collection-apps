import 'package:access_maketicket/src/Model/AccessDetail.dart';
import 'package:access_maketicket/src/Model/Event.dart';
import 'package:access_maketicket/src/Model/Model.dart';
import 'package:access_maketicket/src/Model/PurchaseOrderAccess.dart';
import 'package:access_maketicket/src/Model/User.dart';

class PurchaseOrder extends BaseModel {
  final int id;
  final PurchaseOrderAttributes attributes;
  final PurchaseOrderRelationships? relationships;

  PurchaseOrder(
      {required this.id, required this.attributes, required this.relationships})
      : super(id: id, attributes: attributes);
  
  factory PurchaseOrder.fromJson(Map<String, dynamic> json)
  {
    Map<String, dynamic>? relationships = json['relationships'];
    return PurchaseOrder(
        id: json['id'],
        attributes: PurchaseOrderAttributes.fromJson(json['attributes']),
        relationships: relationships != null ?
        PurchaseOrderRelationships.fromJson(relationships)
            : null
    );
  }
}

class PurchaseOrderAttributes extends Attributes {
  final int user_id;
  final int event_id;
  final int order_status_id;
  final int created_user_id;
  final int order_type_id;
  final double amount;
  final String ip;
  final DateTime created_at;
  final DateTime updated_at;
  final int? observation_id;
  final int? discount_code_id;
  final int? discount;
  final String? observation;

  PurchaseOrderAttributes({
    required this.user_id,
    required this.event_id,
    required this.order_status_id,
    required this.created_user_id,
    required this.order_type_id,
    required this.amount,
    required this.ip,
    required this.created_at,
    required this.updated_at,
    this.discount_code_id,
    this.observation_id,
    this.discount,
    this.observation,
  });

  factory PurchaseOrderAttributes.fromJson(Map<String, dynamic> json) {
    double amount = json['amount'] is double
            ?json['amount']
            : (json['amount'] as int).toDouble();
    return PurchaseOrderAttributes(
      user_id: json['user_id'],
      event_id: json['event_id'],
      order_status_id: json['order_status_id'],
      created_user_id: json['created_user_id'],
      order_type_id: json['order_type_id'],
      amount: amount,
      ip: json['ip'],
      created_at: DateTime.parse(json['created_at']),
      updated_at: DateTime.parse(json['updated_at']),
      discount_code_id: json['discount_code_id'] != null ? json['discount_code_id'] : null,
      observation_id:
          json['observation_id'] != null ? json['observation_id'] : null,
      discount: json['discount'] != null ? json['discount'] : null,
      observation: json['observation'] != null ? json['observation'] : null,
    );
  }
}

class PurchaseOrderRelationships {
  final User user;
  final Event event;
  final List<PurchaseOrderAccess> accesses;

  PurchaseOrderRelationships({
    required this.event,
    required this.accesses,
    required this.user
  });

  factory PurchaseOrderRelationships.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> acceses = (json['accesses'] as List<dynamic>).map((el) => el as Map<String,dynamic>).toList();
    return PurchaseOrderRelationships(
        event: Event.fromJson(json['event']),
        accesses: acceses.map((i) => PurchaseOrderAccess.fromJson(i)).toList(),
        user: User.fromJson(json['user'])
    );
  }
}
