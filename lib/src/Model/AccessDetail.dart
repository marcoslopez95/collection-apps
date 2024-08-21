class AccessDetail{
  final int? access_status_id;
  final int event_id;
  final int total;
  final String access_status_name;

  AccessDetail({
    this.access_status_id,
    required this.event_id,
    required this.total,
    required this.access_status_name,
  });

  factory AccessDetail.fromJson(Map<String, dynamic> json){
    return AccessDetail(
        access_status_id: json['access_status_id'],
        event_id: json['event_id'],
        total: json['total'],
        access_status_name: json['access_status_name']);
  }
}