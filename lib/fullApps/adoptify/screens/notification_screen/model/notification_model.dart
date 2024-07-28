class NotifactionModel {
  final String icon;
  final String title;
  final String description;
  final String time;
  final bool hasNotification;

  NotifactionModel({
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    this.hasNotification = false,
  });
}
