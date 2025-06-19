class UserFollowUnfollowModel {
  final String status;
  final int statusCode;
  final String message;
  final FollowUnfollowUserData data;

  UserFollowUnfollowModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory UserFollowUnfollowModel.fromJson(Map<String, dynamic> json) {
    return UserFollowUnfollowModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: FollowUnfollowUserData.fromJson(json['data'] ?? {}),
    );
  }
}

class FollowUnfollowUserData {
  final FollowUnfollowUserAttributes attributes;

  FollowUnfollowUserData({required this.attributes});

  factory FollowUnfollowUserData.fromJson(Map<String, dynamic> json) {
    return FollowUnfollowUserData(
      attributes:
          FollowUnfollowUserAttributes.fromJson(json['attributes'] ?? {}),
    );
  }
}

class FollowUnfollowUserAttributes {
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
  final bool verified;
  final int logsCount;
  final List<String> followers;
  final List<String> following;
  final List<dynamic> badges;

  FollowUnfollowUserAttributes({
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
    required this.verified,
    required this.logsCount,
    required this.followers,
    required this.following,
    required this.badges,
  });

  factory FollowUnfollowUserAttributes.fromJson(Map<String, dynamic> json) {
    return FollowUnfollowUserAttributes(
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
      verified: json['verified'] ?? false,
      logsCount: json['logsCount'] ?? 0,
      followers: (json['followers'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      following: (json['following'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      badges: json['badges'] ?? [],
    );
  }
}
