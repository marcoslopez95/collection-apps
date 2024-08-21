import 'package:access_maketicket/src/Model/Image.dart';
import 'package:access_maketicket/src/Model/Model.dart';

class Avatar extends BaseModel {
  final int id;
  final AvatarAttributes attributes;
  final AvatarRelationships? relationships;

  Avatar({required this.id, required this.attributes, this.relationships})
      : super(id: id, attributes: attributes);

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
        id: json['id'],
        attributes: AvatarAttributes.fromJson(json['attributes']),
        relationships: AvatarRelationships.fromJson(json['relationships']));
  }
}

class AvatarAttributes extends Attributes {
  final int? image_id;

  AvatarAttributes({this.image_id});

  factory AvatarAttributes.fromJson(Map<String, dynamic> json) {
    return AvatarAttributes(
      image_id: json['image_id'],
    );
  }
}

class AvatarRelationships {
  final Image? image;

  AvatarRelationships({this.image});

  factory AvatarRelationships.fromJson(Map<String, dynamic> json) {
    return AvatarRelationships(
        image: json['image'] != null ? Image.fromJson(json['image']) : null);
  }
}
