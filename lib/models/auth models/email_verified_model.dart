import 'package:palette/models/common_models.dart';

class EmailVerifiedResponse {
  final String status;
  final int statusCode;
  final String message;
  final String accessToken;
  final UserAttributes attributes;

  EmailVerifiedResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.accessToken,
    required this.attributes,
  });

  factory EmailVerifiedResponse.fromJson(Map<String, dynamic> json) {
    return EmailVerifiedResponse(
      status: json['status'] ?? '',
      statusCode: int.tryParse(json['statusCode'].toString()) ?? 0,
      message: json['message'] ?? '',
      accessToken: json['data']['accessToken'] ?? '',
      attributes: UserAttributes.fromJson(json['data']['attributes']),
    );
  }
}
