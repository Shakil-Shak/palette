class OtpVerifiedResponse {
  final String status;
  final int statusCode;
  final String message;
  final String forgetPasswordToken;

  OtpVerifiedResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.forgetPasswordToken,
  });

  factory OtpVerifiedResponse.fromJson(Map<String, dynamic> json) {
    return OtpVerifiedResponse(
      status: json['status'] ?? '',
      statusCode: int.tryParse(json['statusCode'].toString()) ?? 0,
      message: json['message'] ?? '',
      forgetPasswordToken: json['data']['forgetPasswordToken'] ?? '',
    );
  }
}
