class ResendOtpResponse {
  final String status;
  final int statusCode;
  final String message;

  ResendOtpResponse({
    required this.status,
    required this.statusCode,
    required this.message,
  });

  factory ResendOtpResponse.fromJson(Map<String, dynamic> json) {
    return ResendOtpResponse(
      status: json['status'] ?? '',
      statusCode: int.tryParse(json['statusCode'].toString()) ?? 0,
      message: json['message'] ?? '',
    );
  }
}
