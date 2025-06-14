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

class Menu {
  final String id;
  final String name;
  final String? image;
  final double rating;
  final DateTime createdAt;
  final String restaurentName;
  final String restaurentId;
  final String category;
  final String categoryId;

  Menu({
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

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
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

class FeedbackItem {
  final String id;
  final String sender;
  final String menu;
  final String type;
  final int rating;
  final String comment;
  final bool? pinned;
  final String? image;
  final String? video;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FeedbackItem({
    required this.id,
    required this.sender,
    required this.menu,
    required this.type,
    required this.rating,
    required this.comment,
    this.pinned,
    this.image,
    this.video,
    this.createdAt,
    this.updatedAt,
  });

  factory FeedbackItem.fromJson(Map<String, dynamic> json) {
    return FeedbackItem(
      id: json['_id'],
      sender: json['sender'],
      menu: json['menu'],
      type: json['type'],
      rating: json['rating'],
      comment: json['comment'],
      pinned: json['pinned'],
      image: json['image'],
      video: json['video'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}
