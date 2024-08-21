import 'package:access_maketicket/src/Model/Model.dart';

class Image extends BaseModel
{
  final int id;
  final ImageAttributes attributes;

  Image({
    required this.id,
    required this.attributes
  }): super(id: id,attributes: attributes);

  factory Image.fromJson(Map<String, dynamic> json)
  {
    return Image(
      id: json['id'],
      attributes: ImageAttributes.fromJson(json['attributes']),
    );
  }
}

class ImageAttributes extends Attributes
{
  final String path;
  final String full_path;
  final String extension;
  final int size;
  final String type;

  ImageAttributes({
    required this.path,
    required this.full_path,
    required this.extension,
    required this.size,
    required this.type,
  });
  factory ImageAttributes.fromJson(Map<String, dynamic> json)
  {
    return ImageAttributes(
      path: json['path'],
      full_path: json['full_path'],
      extension: json['extension'],
      size: json['size'],
      type: json['type'],
    );
  }
}