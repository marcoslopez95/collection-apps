class QrScans
{
  final int scans_count;

  QrScans({
    required this.scans_count
  });

  factory QrScans.fromJson(int scans_count)
  {
    return QrScans(scans_count: scans_count);
  }
}