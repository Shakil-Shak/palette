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
  final List<RestaurantAttributes> attributes;

  RestaurantData({
    required this.type,
    required this.attributes,
  });

  factory RestaurantData.fromJson(Map<String, dynamic> json) {
    return RestaurantData(
      type: json['type'],
      attributes: List<RestaurantAttributes>.from(
        json['attributes'].map((x) => RestaurantAttributes.fromJson(x)),
      ),
    );
  }
}

class RestaurantAttributes {
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
  final List<String> followers;
  final List<String> following;
  final String address;
  final List<dynamic> badges;
  final int logsCount;
  final List<RestaurantInfo> restaurant;
  final List<dynamic> feedbacks;
  final List<RestaurantGallery> gallery;
  final List<RestaurantMenu> menus;

  RestaurantAttributes({
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
    required this.followers,
    required this.following,
    required this.address,
    required this.badges,
    required this.logsCount,
    required this.restaurant,
    required this.feedbacks,
    required this.gallery,
    required this.menus,
  });

  factory RestaurantAttributes.fromJson(Map<String, dynamic> json) {
    return RestaurantAttributes(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      image: json['image'],
      coverImage: json['coverImage'],
      isComplete: json['isComplete'],
      isBan: json['isBan'],
      role: json['role'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      followers: List<String>.from(json['followers']),
      following: List<String>.from(json['following']),
      address: json['address'],
      badges: json['badges'],
      logsCount: json['logsCount'],
      restaurant: List<RestaurantInfo>.from(
        json['restaurant'].map((x) => RestaurantInfo.fromJson(x)),
      ),
      feedbacks: json['feedbacks'],
      gallery: List<RestaurantGallery>.from(
        json['gallery'].map((x) => RestaurantGallery.fromJson(x)),
      ),
      menus: List<RestaurantMenu>.from(
        json['menus'].map((x) => RestaurantMenu.fromJson(x)),
      ),
    );
  }
}

class RestaurantInfo {
  final String id;
  final String user;
  final List<String> cuisines;
  final List<RestaurantOpenHour> openHours;
  final String createdAt;
  final String updatedAt;
  final int rating;
  final int totalFeedback;

  RestaurantInfo({
    required this.id,
    required this.user,
    required this.cuisines,
    required this.openHours,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.totalFeedback,
  });

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) {
    return RestaurantInfo(
      id: json['_id'],
      user: json['user'],
      cuisines: List<String>.from(json['cuisines']),
      openHours: List<RestaurantOpenHour>.from(
        json['openHours'].map((x) => RestaurantOpenHour.fromJson(x)),
      ),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      rating: json['rating'],
      totalFeedback: json['totalfeedback'],
    );
  }
}

class RestaurantOpenHour {
  final String day;
  final bool isOpen;
  final String openingTime;
  final String closingTime;
  final String id;

  RestaurantOpenHour({
    required this.day,
    required this.isOpen,
    required this.openingTime,
    required this.closingTime,
    required this.id,
  });

  factory RestaurantOpenHour.fromJson(Map<String, dynamic> json) {
    return RestaurantOpenHour(
      day: json['day'],
      isOpen: json['isOpen'],
      openingTime: json['openingTime'],
      closingTime: json['closingTime'],
      id: json['_id'],
    );
  }
}

class RestaurantGallery {
  final String id;
  final String user;
  final List<dynamic> images;
  final String createdAt;
  final String updatedAt;

  RestaurantGallery({
    required this.id,
    required this.user,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RestaurantGallery.fromJson(Map<String, dynamic> json) {
    return RestaurantGallery(
      id: json['_id'],
      user: json['user'],
      images: json['images'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class RestaurantMenu {
  final String id;
  final String name;
  final String image;
  final String description;
  final double price;
  final List<String> category;
  final double rating;
  final String user;
  final String createdAt;
  final String updatedAt;
  final int totalFeedback;

  RestaurantMenu({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.category,
    required this.rating,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.totalFeedback,
  });

  factory RestaurantMenu.fromJson(Map<String, dynamic> json) {
    return RestaurantMenu(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      category: List<String>.from(json['category']),
      rating: (json['rating'] as num).toDouble(),
      user: json['user'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      totalFeedback: json['totalfeedback'],
    );
  }
}
