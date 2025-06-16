import 'package:palette/models/common_models.dart';

class HighLightsResponse {
  final String status;
  final int statusCode;
  final String type;
  final String message;
  final List<FoodMenu> data;

  HighLightsResponse({
    required this.status,
    required this.statusCode,
    required this.type,
    required this.message,
    required this.data,
  });

  factory HighLightsResponse.fromJson(Map<String, dynamic> json) {
    return HighLightsResponse(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      type: json['type'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List)
          .map((item) => FoodMenu.fromJson(item))
          .toList(),
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
