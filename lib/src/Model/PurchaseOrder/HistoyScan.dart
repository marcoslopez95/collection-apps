import 'package:access_maketicket/src/Model/Model.dart';
import 'package:access_maketicket/src/Model/User.dart';

class Access {
  final int id;
  final String name;

  Access({required this.id, required this.name});

  factory Access.fromJson(Map<String, dynamic> json){
    return Access(id: json['id'], name: json['name']);
  }
}

class HistoryScan {
  final int id;
  final Access access_new;
  final Access access_old;
  final String ip_address;
  final String user_agent;
  final String created_at;
  final String updated_at;
  final User user;

  HistoryScan({
      required this.id,
      required this.access_new,
      required this.access_old,
      required this.ip_address,
      required this.user_agent,
      required this.created_at,
      required this.updated_at,
      required this.user
});

  factory HistoryScan.fromJson(Map<String, dynamic> json)
  {
    return HistoryScan(
        id:json['id'],
        access_new: Access.fromJson(json['access_new']),
        access_old: Access.fromJson(json['access_old']),
        ip_address: json['ip_address'],
        user_agent: json['user_agent'],
        created_at: json['created_at'],
        updated_at: json['updated_at'],
        user: User.fromJson(json['user']),
    );
  }
}
