import 'package:access_maketicket/src/Model/Model.dart';
import 'package:access_maketicket/src/Model/Permission.dart';

class Role extends BaseModel
{
  final int id;
  final RoleAttributes attributes;
  final RoleRelationships? relationships;

  Role({
    required this.id,
    required this.attributes,
    this.relationships
  }) : super(id: id, attributes: attributes);

  factory Role.fromJson(Map<String, dynamic> json)
  {
    return Role(
      id: json['id'],
      attributes: RoleAttributes.fromJson(json['attributes']),
      relationships: json['relationships'] != null && json['relationships']['permissions'] != null ? RoleRelationships(permissions: json['relationships']['permissions']): null
      );
  }
}

class RoleAttributes extends Attributes
{
  final String name;
  final String guard_name;
  final DateTime created_at;
  final String? description;
  final DateTime? updated_at;

  RoleAttributes({
    required this.name,
    required this.guard_name,
    required this.created_at,
    this.description,
    this.updated_at,
  });

  factory RoleAttributes.fromJson(Map<String,dynamic> json)
  {
    return RoleAttributes(
      name: json['name'],
      guard_name: json['guard_name'],
      created_at: DateTime.parse(json['created_at']),
      description: json['description'] != null ? json['description'] : null,
      updated_at: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      );
  }
}

class RoleRelationships
{
  final List<Permission> permissions;

  RoleRelationships({
    required this.permissions
  });

  factory RoleRelationships.fromJson(List<Map<String,dynamic>> json)
  {
    return RoleRelationships(
      permissions: json.map((i) {
        return Permission.fromJson(i);
      }).toList()
    );
  }
}