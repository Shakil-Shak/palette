class ForgetPasswordOtpResponse {
  final String status;
  final int statusCode;
  final String message;

  ForgetPasswordOtpResponse({
    required this.status,
    required this.statusCode,
    required this.message,
  });

  factory ForgetPasswordOtpResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordOtpResponse(
      status: json['status'] ?? '',
      statusCode: int.tryParse(json['statusCode'].toString()) ?? 0,
      message: json['message'] ?? '',
    );
  }
}
