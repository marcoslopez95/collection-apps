class QrScans
{
  final String name;
  final int value;

  QrScans({
    required this.name,
    required this.value
  });

  factory QrScans.fromJson(Map<String, dynamic> json)
  {
    return QrScans(
      name: json['name'],
      value: json['value']
    );
  }
}