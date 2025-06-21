class TopRatedItemsModel {
  final String status;
  final int statusCode;
  final String message;
  final TopRatedData data;

  TopRatedItemsModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory TopRatedItemsModel.fromJson(Map<String, dynamic> json) {
    return TopRatedItemsModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: TopRatedData.fromJson(json['data'] ?? {}),
    );
  }
}

class TopRatedData {
  final String type;
  final List<TopRatedItem> attributes;

  TopRatedData({
    required this.type,
    required this.attributes,
  });

  factory TopRatedData.fromJson(Map<String, dynamic> json) {
    return TopRatedData(
      type: json['type'] ?? '',
      attributes: (json['attributes'] as List<dynamic>? ?? [])
          .map((item) => TopRatedItem.fromJson(item))
          .toList(),
    );
  }
}

class TopRatedItem {
  final String id;
  final int rating;
  final bool pinned;
  final String menuName;
  final String? menuImage;
  final String menuId;
  final String restaurentName;

  TopRatedItem({
    required this.id,
    required this.rating,
    required this.pinned,
    required this.menuName,
    this.menuImage,
    required this.menuId,
    required this.restaurentName,
  });

  factory TopRatedItem.fromJson(Map<String, dynamic> json) {
    return TopRatedItem(
      id: json['_id'] ?? '',
      rating: json['rating'] ?? 0,
      pinned: json['pinned'] ?? false,
      menuName: json['menuName'] ?? '',
      menuImage: json['menuImage'], // nullable
      menuId: json['menuId'] ?? '',
      restaurentName: json['restaurentName'] ?? '',
    );
  }
}
