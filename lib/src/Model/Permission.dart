import 'package:access_maketicket/src/Model/Model.dart';

class Permission extends BaseModel
{
  final int id;
  final PermissionAttributes attributes;

  Permission({
    required this.id,
    required this.attributes
  }) : super(id: id, attributes: attributes);

  factory Permission.fromJson(Map<String, dynamic> json)
  {
    return Permission(
      id: json['id'],
      attributes: PermissionAttributes.fromJson(json['attributes'])
      );
  }
}

class PermissionAttributes extends Attributes
{
  final String name;
  final String guard_name;
  final DateTime created_at;
  final String? description;
  final DateTime? updated_at;

  PermissionAttributes({
    required this.name,
    required this.guard_name,
    required this.created_at,
    this.description,
    this.updated_at,
  });

  factory PermissionAttributes.fromJson(Map<String,dynamic> json)
  {
    return PermissionAttributes(
      name: json['name'],
      guard_name: json['guard_name'],
      created_at: DateTime.parse(json['created_at']),
      description: json['description'] != null ? json['description'] : null,
      updated_at: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      );
  }
}