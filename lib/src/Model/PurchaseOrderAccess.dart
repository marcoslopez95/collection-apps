import 'package:access_maketicket/src/Model/Model.dart';
import 'package:access_maketicket/src/Model/PurchaseOrder/Chair.dart';
import 'package:access_maketicket/src/Model/PurchaseOrder/StatusAccess.dart';

class PurchaseOrderAccess extends BaseModel {
  final int id;
  final PurchaseOrderAccessAttributes attributes;
  final PurchaseOrderAccessRelationships? relationships;

  PurchaseOrderAccess(
      {required this.id, required this.attributes, this.relationships})
      : super(id: id, attributes: attributes);
  
  factory PurchaseOrderAccess.fromJson(Map<String,dynamic> json)
  {
    return PurchaseOrderAccess(
        id: json['id'],
        attributes: PurchaseOrderAccessAttributes.fromJson(json['attributes']),
        relationships: PurchaseOrderAccessRelationships.fromJson(json['relationships'])
    );
  }
}

class PurchaseOrderAccessAttributes extends Attributes {
  final String uuid;

  PurchaseOrderAccessAttributes({required this.uuid});

  factory PurchaseOrderAccessAttributes.fromJson(Map<String, dynamic> json) {
    return PurchaseOrderAccessAttributes(uuid: json['uuid']);
  }
}

class PurchaseOrderAccessRelationships {
  final StatusAccess? status;
  final Chair? chair;

  PurchaseOrderAccessRelationships({this.chair, this.status});

  factory PurchaseOrderAccessRelationships.fromJson(Map<String, dynamic> json) {
    return PurchaseOrderAccessRelationships(
        chair: json['chair'] != null ? Chair.fromJson(json['chair']) : null,
        status: json['status'] != null ? StatusAccess.fromJson(json['status']) : null
    );
  }
}
