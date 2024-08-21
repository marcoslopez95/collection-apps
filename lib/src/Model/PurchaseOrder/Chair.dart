import 'package:access_maketicket/src/Model/Model.dart';
import 'package:access_maketicket/src/Model/PurchaseOrder/Article.dart';

class Chair extends BaseModel {
  final int id;
  final ChairAttributes attributes;
  final ChairRelationships relationships;

  Chair({
    required this.id,
    required this.attributes,
    required this.relationships,
  }) : super(id: id, attributes: attributes);

  factory Chair.fromJson(Map<String, dynamic> json)
  {
    return Chair(id: json['id'],
        attributes: ChairAttributes.fromJson(json['attributes']),
        relationships: ChairRelationships.fromJson(json['relationships'])
    );
  }
}

class ChairAttributes extends Attributes {
  final int event_id;
  final int article_id;
  final String uuid;
  final String zone;
  final String row;
  final String number;
  final String? table;

  ChairAttributes({
    required this.event_id,
    required this.article_id,
    required this.uuid,
    required this.zone,
    required this.row,
    required this.number,
    this.table,
  });

  factory ChairAttributes.fromJson(Map<String, dynamic> json)
  {
    return ChairAttributes(
      event_id: json['event_id'],
      article_id: json['article_id'],
      uuid: json['uuid'],
      zone: json['zone'],
      row: json['row'],
      number: json['number'],
      table: json['table'],
    );
  }
}

class ChairRelationships {
  final Article article;

  ChairRelationships({
    required this.article,
  });

  factory ChairRelationships.fromJson(Map<String, dynamic> json) {
    return ChairRelationships(article: Article.fromJson(json['article']));
  }
}
