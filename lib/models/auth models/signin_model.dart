import 'package:palette/models/common_models.dart';

class LoginResponse {
  final String status;
  final int statusCode;
  final String message;
  final LoginData data;

  LoginResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: LoginData.fromJson(json['data']),
    );
  }
}

class LoginData {
  final String type;
  final UserAttributes attributes;
  final String accessToken;

  LoginData({
    required this.type,
    required this.attributes,
    required this.accessToken,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      type: json['type'] ?? '',
      attributes: UserAttributes.fromJson(json['attributes']),
      accessToken: json['accessToken'] ?? '',
    );
  }
}
