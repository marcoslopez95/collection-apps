import 'package:access_maketicket/fullApps/adoptify/screens/profile/profile.dart';
import 'package:access_maketicket/src/Model/Avatar.dart';
import 'package:access_maketicket/src/Model/Model.dart';

class Profile extends BaseModel{
  final int id;
  final ProfileAttributes attributes;
  final ProfileRelationships relationships;

  Profile({
    required this.id,
    required this.attributes,
    required this.relationships,
}): super(id:id,attributes: attributes);

  factory Profile.fromJson(Map<String,dynamic> json)
  {
    return Profile(
        id: json['id'],
        attributes: ProfileAttributes.fromJson(json['attributes']),
        relationships: ProfileRelationships.fromJson(json['relationships']),
    );
  }
}

class ProfileAttributes extends Attributes{
  final String? dni;
  final String? phone_number;
  final String? emergency_phone_number;
  final String? email_recovery;
  final int? age;
  final int? avatar_id;
  final String? birth_date;

  ProfileAttributes({
    this.dni,
    this.phone_number,
    this.emergency_phone_number,
    this.email_recovery,
    this.age,
    this.avatar_id,
    this.birth_date,
});

  factory ProfileAttributes.fromJson(Map<String,dynamic> json)
  {
    return ProfileAttributes(
        dni: json['dni'],
        phone_number: json['phone_number'],
        emergency_phone_number: json['emergency_phone_number'],
        email_recovery: json['email_recovery'],
        age: json['age'],
        avatar_id: json['avatar_id'],
        birth_date: json['birth_date'],
    );
  }
}

class ProfileRelationships
{
  final Avatar? avatar;

  ProfileRelationships({
    this.avatar
});

  factory ProfileRelationships.fromJson(Map<String, dynamic> json)
  {
    return ProfileRelationships(
      avatar: json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null
    );
  }
}