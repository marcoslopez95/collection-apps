import 'package:prokit_flutter/src/Model/Model.dart';

class Event extends BaseModel{
  final int id;
  final EventAttributes attributes;

  Event({
    required this.id,
    required this.attributes
}) : super(id: id, attributes: attributes);
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      attributes: EventAttributes.fromJson(json['attributes']),
      /*relationships: R.fromJson(json['relationships']),*/
    );
  }
}

class EventAttributes extends Attributes{
  final String? name;
  final String? description;
  final bool active;
  final int? event_type_id;
  final String? deleted_at;

  EventAttributes({
    required this.name,
    required this.description,
    this.active = false,
    this.event_type_id,
    this.deleted_at,
  });

  factory EventAttributes.fromJson(Map<String, dynamic> json) {
    return EventAttributes(
    name: json['name'],
    description: json['description'],
    active: json['active'] == 1 ? true : false,
    event_type_id: json['event_type_id'],
    deleted_at: json['deleted_at'],
    );
  }
}