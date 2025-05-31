class SignupData {
  final String type;
  final String signUpToken;

  SignupData({
    required this.type,
    required this.signUpToken,
  });

  factory SignupData.fromJson(Map<String, dynamic> json) {
    return SignupData(
      type: json['type'] ?? '',
      signUpToken: json['signUpToken'] ?? '',
    );
  }
}

class SignupResponse {
  final String status;
  final int statusCode;
  final String message;
  final SignupData data;

  SignupResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? '',
      message: json['message'] ?? '',
      data: SignupData.fromJson(json['data']),
    );
  }
}
