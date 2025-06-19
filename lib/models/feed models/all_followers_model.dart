class AllFollowersModel {
  final String status;
  final int statusCode;
  final String message;
  final FollowersData data;

  AllFollowersModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AllFollowersModel.fromJson(Map<String, dynamic> json) {
    return AllFollowersModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: FollowersData.fromJson(json['data'] ?? {}),
    );
  }
}

class FollowersData {
  final List<FollowerAttributes> attributes;

  FollowersData({required this.attributes});

  factory FollowersData.fromJson(Map<String, dynamic> json) {
    return FollowersData(
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => FollowerAttributes.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class FollowerAttributes {
  final String id;
  final String fullName;
  final String image;
  bool isFollowing;

  FollowerAttributes({
    required this.id,
    required this.fullName,
    required this.image,
    required this.isFollowing,
  });

  factory FollowerAttributes.fromJson(Map<String, dynamic> json) {
    return FollowerAttributes(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      image: json['image'] ?? '',
      isFollowing: json['isFollowing'] ?? false,
    );
  }
}
