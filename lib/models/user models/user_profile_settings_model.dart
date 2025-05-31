import 'package:palette/models/common_models.dart';

class UserProfileResponse {
  final String status;
  final int statusCode;
  final String message;
  final UserAttributes attributes;

  UserProfileResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.attributes,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      status: json['status'] ?? '',
      statusCode: int.tryParse(json['statusCode'].toString()) ?? 0,
      message: json['message'] ?? '',
      attributes: UserAttributes.fromJson(json['data']['attributes']),
    );
  }
}
