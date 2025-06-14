import 'package:palette/models/common_models.dart';

class ForYouResponse {
  final String status;
  final int statusCode;
  final String type;
  final String message;
  final List<Menu> data;

  ForYouResponse({
    required this.status,
    required this.statusCode,
    required this.type,
    required this.message,
    required this.data,
  });

  factory ForYouResponse.fromJson(Map<String, dynamic> json) {
    return ForYouResponse(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      type: json['type'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List).map((item) => Menu.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'statusCode': statusCode,
      'type': type,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
