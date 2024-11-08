import 'package:access_maketicket/src/Model/Model.dart';
import 'package:access_maketicket/src/Model/Profile.dart';

class User extends BaseModel
{
  final int id;
  final UserAttributes attributes;
  final UserRelationships relationships;
  
  User({
    required this.id,
    required this.attributes,
    required this.relationships,
}) : super(id: id,attributes: attributes);
  
  factory User.fromJson(Map<String,dynamic> json)
  {
    return User(
      id: json['id'],
      attributes: UserAttributes.fromJson(json['attributes']),
      relationships:  UserRelationships.fromJson(
          json['relationships'] is List<dynamic>
              ? {}
              : json['relationships']
      )
    );
  }
}
class UserAttributes extends Attributes {
  final String name;
  final String email;

  UserAttributes({required this.name, required this.email});

  factory UserAttributes.fromJson(Map<String, dynamic> json) {
    return UserAttributes(name: json['name'], email: json['email']);
  }
}

class UserRelationships
{
  final Profile? profile;

  UserRelationships({
    this.profile
});

  factory UserRelationships.fromJson(Map<String, dynamic> json)
  {
    return UserRelationships(
      profile: json['profile'] != null ? Profile.fromJson(json['profile']): null
    );
  }
}
