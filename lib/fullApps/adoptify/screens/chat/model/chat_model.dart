class MessageModel {
  final String? name;
  final String? message;
  final String? time;
  final String? image;
  final String? unread;

  MessageModel({this.name, this.message, this.time, this.image, this.unread});
}

class CallModel {
  final String? name;
  final String? time;
  final String? image;
  final String? callimage;
  final String? indication;

  CallModel({required this.name, required this.time, required this.image, this.indication, required this.callimage});
}
