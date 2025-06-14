import 'package:palette/models/common_models.dart';

class LoginResponse {
  final String status;
  final int statusCode;
  final String message;
  final UserData data;
  final List<dynamic> errors;

  LoginResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: UserData.fromJson(json['data']),
      errors: json['errors'] ?? [],
    );
  }
}

class UserData {
  final String type;
  final UserAttributes attributes;
  final String accessToken;

  UserData({
    required this.type,
    required this.attributes,
    required this.accessToken,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      type: json['type'] ?? '',
      attributes: UserAttributes.fromJson(json['attributes']),
      accessToken: json['accessToken'] ?? '',
    );
  }
}
