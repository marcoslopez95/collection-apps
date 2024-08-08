import 'dart:convert';

class BaseModel{
  final int id;
  final Attributes attributes;
  /*final R? relationships;*/

  BaseModel({
    required this.id,
    required this.attributes,
    /*this.relationships,*/
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
      id: json['id'],
      attributes: Attributes.fromJson(json['attributes']),
      /*relationships: R.fromJson(json['relationships']),*/
    );
  }
}

class Attributes{
  Attributes();
  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes();
  }
}
