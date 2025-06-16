class UserAttributes {
  final String id;
  final String fullName;
  final String email;
  final String image;
  final String coverImage;
  final bool isComplete;
  final bool isBan;
  final String role;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String phoneNumber;
  final String aboutMe;

  UserAttributes({
    required this.id,
    required this.fullName,
    required this.email,
    required this.image,
    required this.coverImage,
    required this.isComplete,
    required this.isBan,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.phoneNumber,
    required this.aboutMe,
  });

  factory UserAttributes.fromJson(Map<String, dynamic> json) {
    return UserAttributes(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      coverImage: json['coverImage'] ?? '',
      isComplete: json['isComplete'] ?? false,
      isBan: json['isBan'] ?? false,
      role: json['role'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      phoneNumber: json['phoneNumber'] ?? '',
      aboutMe: json['aboutme'] ?? '',
    );
  }
}

class FoodMenu {
  final String id;
  final String name;
  final String? image;
  final double rating;
  final DateTime createdAt;
  final String restaurentName;
  final String restaurentId;
  final String category;
  final String categoryId;

  FoodMenu({
    required this.id,
    required this.name,
    this.image,
    required this.rating,
    required this.createdAt,
    required this.restaurentName,
    required this.restaurentId,
    required this.category,
    required this.categoryId,
  });

  factory FoodMenu.fromJson(Map<String, dynamic> json) {
    return FoodMenu(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      restaurentName: json['restaurentName'] ?? '',
      restaurentId: json['restaurentId'] ?? '',
      category: json['category'] ?? '',
      categoryId: json['categoryId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'rating': rating,
      'createdAt': createdAt.toIso8601String(),
      'restaurentName': restaurentName,
      'restaurentId': restaurentId,
      'category': category,
      'categoryId': categoryId,
    };
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

class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
    );
  }
}
