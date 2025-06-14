import 'package:palette/models/common_models.dart';

class MenuDetailsResponse {
  final String status;
  final int statusCode;
  final String message;
  final MenuData data;

  MenuDetailsResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory MenuDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MenuDetailsResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: MenuData.fromJson(json['data']),
    );
  }
}

class MenuData {
  final String type;
  final List<MenuItem> attributes;

  MenuData({
    required this.type,
    required this.attributes,
  });

  factory MenuData.fromJson(Map<String, dynamic> json) {
    return MenuData(
      type: json['type'],
      attributes: List<MenuItem>.from(
        json['attributes'].map((x) => MenuItem.fromJson(x)),
      ),
    );
  }
}

class MenuItem {
  final String id;
  final String name;
  final String image;
  final String description;
  final double price;
  final List<String> category;
  final int rating;
  final List<FeedbackItem> feedbacks;
  final String restaurentName;

  MenuItem({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.category,
    required this.rating,
    required this.feedbacks,
    required this.restaurentName,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      category: List<String>.from(json['category']),
      rating: json['rating'],
      feedbacks: List<FeedbackItem>.from(
        json['feedbacks'].map((x) => FeedbackItem.fromJson(x)),
      ),
      restaurentName: json['restaurentName'],
    );
  }
}
