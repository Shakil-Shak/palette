import 'package:palette/models/common_models.dart';

class MenuByRestaurantIdResponse {
  final int status;
  final int statusCode;
  final String message;
  final MenuData data;
  final List<dynamic> errors;

  MenuByRestaurantIdResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory MenuByRestaurantIdResponse.fromJson(Map<String, dynamic> json) {
    return MenuByRestaurantIdResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: MenuData.fromJson(json['data']),
      errors: json['errors'] ?? [],
    );
  }
}

class MenuData {
  final String type;
  final List<RestaurantMenu> attributes;

  MenuData({
    required this.type,
    required this.attributes,
  });

  factory MenuData.fromJson(Map<String, dynamic> json) {
    return MenuData(
      type: json['type'],
      attributes: (json['attributes'] as List)
          .map((item) => RestaurantMenu.fromJson(item))
          .toList(),
    );
  }
}
