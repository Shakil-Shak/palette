import 'package:palette/models/common_models.dart';

class RestaurantDetailsResponse {
  final int status;
  final int statusCode;
  final String message;
  final RestaurantData data;

  RestaurantDetailsResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory RestaurantDetailsResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailsResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: RestaurantData.fromJson(json['data']),
    );
  }
}

class RestaurantData {
  final String type;
  final RestaurantAttributes attributes;

  RestaurantData({
    required this.type,
    required this.attributes,
  });

  factory RestaurantData.fromJson(Map<String, dynamic> json) {
    return RestaurantData(
      type: json['type'],
      attributes: RestaurantAttributes.fromJson(json['attributes']),
    );
  }
}

class RestaurantAttributes {
  final String id;
  final String fullName;
  final String image;
  final String coverImage;
  final String address;
  final String phoneNumber;
  final Restaurant restaurant;
  final List<RestaurantFeedback> feedbacks;
  final List<String> gallery;
  final List<RestaurantMenu> menus;

  RestaurantAttributes({
    required this.id,
    required this.fullName,
    required this.image,
    required this.coverImage,
    required this.address,
    required this.phoneNumber,
    required this.restaurant,
    required this.feedbacks,
    required this.gallery,
    required this.menus,
  });

  factory RestaurantAttributes.fromJson(Map<String, dynamic> json) {
    return RestaurantAttributes(
      id: json['_id'],
      fullName: json['fullName'],
      image: json['image'],
      coverImage: json['coverImage'],
      address: json['address'],
      phoneNumber: json["phoneNumber"],
      restaurant: Restaurant.fromJson(json['restaurant']),
      feedbacks: (json['feedbacks'] as List)
          .map((f) => RestaurantFeedback.fromJson(f))
          .toList(),
      gallery: List<String>.from(json['gallery']),
      menus: (json['menus'] as List)
          .map((m) => RestaurantMenu.fromJson(m))
          .toList(),
    );
  }
}

class Restaurant {
  final String id;
  final String user;
  final List<String> cuisines;
  final List<OpenHour> openHours;
  final String createdAt;
  final String updatedAt;
  final double rating;
  final int totalFeedback;

  Restaurant({
    required this.id,
    required this.user,
    required this.cuisines,
    required this.openHours,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.totalFeedback,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['_id'],
      user: json['user'],
      cuisines: List<String>.from(json['cuisines']),
      openHours:
          (json['openHours'] as List).map((o) => OpenHour.fromJson(o)).toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      rating: (json['rating'] as num).toDouble(),
      totalFeedback: json['totalfeedback'],
    );
  }
}

class OpenHour {
  final String day;
  final bool isOpen;
  final String openingTime;
  final String closingTime;

  OpenHour({
    required this.day,
    required this.isOpen,
    required this.openingTime,
    required this.closingTime,
  });

  factory OpenHour.fromJson(Map<String, dynamic> json) {
    return OpenHour(
      day: json['day'],
      isOpen: json['isOpen'],
      openingTime: json['openingTime'],
      closingTime: json['closingTime'],
    );
  }
}

class RestaurantFeedback {
  final String id;
  final int rating;
  final String comment;
  final String createdAt;
  final String sender;
  final String reviewerId;
  final String reviewerName;
  final String reviewerImage;
  final String? image;
  final String? video;

  RestaurantFeedback({
    required this.id,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.sender,
    required this.reviewerId,
    required this.reviewerName,
    required this.reviewerImage,
    this.image,
    this.video,
  });

  factory RestaurantFeedback.fromJson(Map<String, dynamic> json) {
    return RestaurantFeedback(
      id: json['_id'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: json['createdAt'],
      sender: json['sender'],
      reviewerId: json['reviewerId'],
      reviewerName: json['reviewerName'],
      reviewerImage: json['reviewerImage'],
      image: json['image'],
      video: json['video'],
    );
  }
}

class RestaurantMenu {
  final String id;
  final String name;
  final String image;
  final String description;
  final double price;
  final double rating;
  final int totalFeedback;
  final String user;
  final String createdAt;
  final String updatedAt;
  final Category? category;

  RestaurantMenu({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
    required this.totalFeedback,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    this.category,
  });

  factory RestaurantMenu.fromJson(Map<String, dynamic> json) {
    return RestaurantMenu(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      totalFeedback: json['totalfeedback'],
      user: json['user'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
    );
  }
}
