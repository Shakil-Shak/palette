class PasswordResetResponse {
  final String status;
  final String statusCode;
  final String message;

  PasswordResetResponse({
    required this.status,
    required this.statusCode,
    required this.message,
  });

  factory PasswordResetResponse.fromJson(Map<String, dynamic> json) {
    return PasswordResetResponse(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
