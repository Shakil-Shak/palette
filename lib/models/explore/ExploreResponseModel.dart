class ExploreResponseModel {
  String status;
  int statusCode;
  String message;
  ExploreData data;
  List<dynamic> errors;

  ExploreResponseModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory ExploreResponseModel.fromJson(Map<String, dynamic> json) {
    return ExploreResponseModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: ExploreData.fromJson(json['data'] ?? {}),
      errors: json['errors'] ?? [],
    );
  }
}

class ExploreData {
  ExploreAttributes attributes;

  ExploreData({
    required this.attributes,
  });

  factory ExploreData.fromJson(Map<String, dynamic> json) {
    return ExploreData(
      attributes: ExploreAttributes.fromJson(json['attributes'] ?? {}),
    );
  }
}

class ExploreAttributes {
  List<TopMenu> topMenu;
  List<TopRestaurant> topRestaurent;

  ExploreAttributes({
    required this.topMenu,
    required this.topRestaurent,
  });

  factory ExploreAttributes.fromJson(Map<String, dynamic> json) {
    var topMenuList = (json['topMenu'] as List<dynamic>?)
            ?.map((e) => TopMenu.fromJson(e))
            .toList() ??
        [];
    var topRestaurentList = (json['topRestaurent'] as List<dynamic>?)
            ?.map((e) => TopRestaurant.fromJson(e))
            .toList() ??
        [];

    return ExploreAttributes(
      topMenu: topMenuList,
      topRestaurent: topRestaurentList,
    );
  }
}

class TopMenu {
  String id;
  String name;
  String? image; // nullable because some items have no image
  double rating;
  String category;
  String categoryId;
  String restaurentAddress;
  String restaurentId;

  TopMenu({
    required this.id,
    required this.name,
    this.image,
    required this.rating,
    required this.category,
    required this.categoryId,
    required this.restaurentAddress,
    required this.restaurentId,
  });

  factory TopMenu.fromJson(Map<String, dynamic> json) {
    return TopMenu(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'],
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : (json['rating'] is double)
              ? json['rating']
              : 0.0,
      category: json['category'] ?? '',
      categoryId: json['categoryId'] ?? '',
      restaurentAddress: json['restaurentName'] ?? '',
      restaurentId: json['restaurentId'] ?? '',
    );
  }
}

class TopRestaurant {
  String id;
  List<String> cuisines;
  double rating;
  String fullName;
  String? image;
  String address;
  String userId;

  TopRestaurant({
    required this.id,
    required this.cuisines,
    required this.rating,
    required this.fullName,
    this.image,
    required this.address,
    required this.userId,
  });

  factory TopRestaurant.fromJson(Map<String, dynamic> json) {
    return TopRestaurant(
      id: json['_id'] ?? '',
      cuisines: (json['cuisines'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : (json['rating'] is double)
              ? json['rating']
              : 0.0,
      fullName: json['fullName'] ?? '',
      image: json['image'],
      address: json['address'] ?? '',
      userId: json['userId'] ?? '',
    );
  }
}
