abstract class Model   {
  Attributes? attributes;
  Relationships? relationships;

  Model({required this.attributes, required this.relationships});
}

abstract class Attributes {
  Map<String, dynamic> toJson();
}

abstract class Relationships {
  Map<String, dynamic> toJson();
}