import 'package:access_maketicket/src/Model/Model.dart';
import 'package:access_maketicket/src/Model/Permission.dart';
import 'package:access_maketicket/src/Model/Role.dart';

class UserAuth extends BaseModel
{
  final int id;
  final UserAuthAttributes attributes;
  final UserAuthRelationships? relationships;

  UserAuth({
    required this.id, required this.attributes,
    this.relationships
    })
    : super(id:id, attributes:attributes);

factory UserAuth.fromJson(Map<String, dynamic> json)
{
  return UserAuth(
    id: json['id'],
    attributes: UserAuthAttributes.fromJson(json['attributes']),
    relationships: UserAuthRelationships.fromJson(json['relationships'])
  );
}
}

class UserAuthAttributes extends Attributes
{
  final String name;

  UserAuthAttributes({
    required this.name
  });

  factory UserAuthAttributes.fromJson(Map<String,dynamic> json)
  {
    return UserAuthAttributes(name: json['name']);
  }
}

class UserAuthRelationships
{
  final Role? role;
  final List<Permission>? permissions;

  UserAuthRelationships({
    this.role,
    this.permissions
  });

  factory UserAuthRelationships.fromJson(Map<String,dynamic> json)
  {
    var role = json['role'] as Map<String,dynamic>?;
    var permissions = (json['permissions'] as List<dynamic>?)?.map((el) => el as Map<String,dynamic>).toList() ?? null;
    return UserAuthRelationships(
      role: role != null ? Role.fromJson(role) : null,
      permissions: permissions != null ? permissions.map((i) {
        return Permission.fromJson(i);
      }).toList() : null
    );
  }
}