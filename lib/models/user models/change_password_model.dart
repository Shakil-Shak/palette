import 'package:palette/models/common_models.dart';

class PasswordChangedResponse {
  final String status;
  final int statusCode;
  final String message;
  final UserAttributes attributes;

  PasswordChangedResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.attributes,
  });

  factory PasswordChangedResponse.fromJson(Map<String, dynamic> json) {
    return PasswordChangedResponse(
      status: json['status'] ?? '',
      statusCode: int.tryParse(json['statusCode'].toString()) ?? 0,
      message: json['message'] ?? '',
      attributes: UserAttributes.fromJson(json['data']['attributes']),
    );
  }
}
