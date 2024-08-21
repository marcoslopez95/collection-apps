import 'package:access_maketicket/src/Model/Model.dart';

class StatusAccess extends BaseModel {
  final int id;
  final StatusAccessAttributes attributes;

  StatusAccess({required this.id, required this.attributes})
      : super(id: id, attributes: attributes);
  
  factory StatusAccess.fromJson(Map<String, dynamic> json)
  {
    return StatusAccess(
        id: json['id'], 
        attributes: StatusAccessAttributes.fromJson(json['attributes'])
    );
  }
}

class StatusAccessAttributes extends Attributes{
  final String name;
  final String? description;

  StatusAccessAttributes({required this.name, this.description});

  factory StatusAccessAttributes.fromJson(Map<String, dynamic> json) {
    return StatusAccessAttributes(
      name: json['name'],
      description: json['description'] != null ? json['description'] : null,
    );
  }
}
