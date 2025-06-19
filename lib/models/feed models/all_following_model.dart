class AllFollowingModel {
  final String status;
  final int statusCode;
  final String message;
  final FollowingData data;

  AllFollowingModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AllFollowingModel.fromJson(Map<String, dynamic> json) {
    return AllFollowingModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: FollowingData.fromJson(json['data'] ?? {}),
    );
  }
}

class FollowingData {
  final List<FollowingAttributes> attributes;

  FollowingData({required this.attributes});

  factory FollowingData.fromJson(Map<String, dynamic> json) {
    return FollowingData(
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => FollowingAttributes.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class FollowingAttributes {
  final String id;
  final String fullName;
  final String image;
  bool isFollowing;

  FollowingAttributes({
    required this.id,
    required this.fullName,
    required this.image,
    required this.isFollowing,
  });

  factory FollowingAttributes.fromJson(Map<String, dynamic> json) {
    return FollowingAttributes(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      image: json['image'] ?? '',
      isFollowing: json['isFollowing'] ?? false,
    );
  }
}
