class BadgeListResponse {
  final String status;
  final int statusCode;
  final String message;
  final BadgeData data;

  BadgeListResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory BadgeListResponse.fromJson(Map<String, dynamic> json) {
    return BadgeListResponse(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: BadgeData.fromJson(json['data'] ?? {}),
    );
  }
}

class BadgeData {
  final BadgeAttributesWrapper attributes;

  BadgeData({required this.attributes});

  factory BadgeData.fromJson(Map<String, dynamic> json) {
    return BadgeData(
      attributes: BadgeAttributesWrapper.fromJson(json['attributes'] ?? {}),
    );
  }
}

class BadgeAttributesWrapper {
  final List<BadgeItem> attributes;

  BadgeAttributesWrapper({required this.attributes});

  factory BadgeAttributesWrapper.fromJson(Map<String, dynamic> json) {
    return BadgeAttributesWrapper(
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => BadgeItem.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class BadgeItem {
  final String id;
  final String badgeImage;
  final String challengeTitle;

  BadgeItem({
    required this.id,
    required this.badgeImage,
    required this.challengeTitle,
  });

  factory BadgeItem.fromJson(Map<String, dynamic> json) {
    return BadgeItem(
      id: json['_id'] ?? '',
      badgeImage: json['badgeImage'] ?? '',
      challengeTitle: json['challengeTitle'] ?? '',
    );
  }
}
