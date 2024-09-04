class ApiResponse<T> {
  final bool success;
  final String? message;
  final String? color;
  final String? icon;
  final T? data;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
    this.color,
    this.icon,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
        success: json['success'],
        message: json['message'],
        color: json['color'],
        icon: json['icon'],
        data: json['data'] as T);
  }
}
