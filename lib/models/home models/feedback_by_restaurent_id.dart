class FeedbackByRestaurantIdResponse {
  final String status;
  final int statusCode;
  final String message;
  final FeedbackData data;
  final List<dynamic> errors;

  FeedbackByRestaurantIdResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory FeedbackByRestaurantIdResponse.fromJson(Map<String, dynamic> json) {
    return FeedbackByRestaurantIdResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: FeedbackData.fromJson(json['data']),
      errors: json['errors'] ?? [],
    );
  }
}

class FeedbackData {
  final String type;
  final List<RestaurentFeedbackItem> attributes;

  FeedbackData({
    required this.type,
    required this.attributes,
  });

  factory FeedbackData.fromJson(Map<String, dynamic> json) {
    return FeedbackData(
      type: json['type'],
      attributes: (json['attributes'] as List)
          .map((item) => RestaurentFeedbackItem.fromJson(item))
          .toList(),
    );
  }
}

class RestaurentFeedbackItem {
  final String id;
  final int rating;
  final String comment;
  final String? createdAt;
  final String? image;
  final String? video;
  final String? reviewerName;
  final String? reviewerImage;
  final String? reviewerId;

  RestaurentFeedbackItem({
    required this.id,
    required this.rating,
    required this.comment,
    this.createdAt,
    this.image,
    this.video,
    this.reviewerName,
    this.reviewerImage,
    this.reviewerId,
  });

  factory RestaurentFeedbackItem.fromJson(Map<String, dynamic> json) {
    return RestaurentFeedbackItem(
      id: json['_id'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: json['createdAt'],
      image: json['image'],
      video: json['video'],
      reviewerName: json['reviewerName'],
      reviewerImage: json['reviewerImage'],
      reviewerId: json['reviewerId'],
    );
  }
}
