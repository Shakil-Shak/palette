class FoodMenuDetailsResponse {
  String status;
  int statusCode;
  String message;
  MenuData data;

  FoodMenuDetailsResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory FoodMenuDetailsResponse.fromJson(Map<String, dynamic> json) {
    return FoodMenuDetailsResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: MenuData.fromJson(json['data']),
    );
  }
}

class MenuData {
  String type;
  List<FoodMenuAttributes> attributes;

  MenuData({required this.type, required this.attributes});

  factory MenuData.fromJson(Map<String, dynamic> json) {
    return MenuData(
      type: json['type'],
      attributes: List<FoodMenuAttributes>.from(
        json['attributes'].map((x) => FoodMenuAttributes.fromJson(x)),
      ),
    );
  }
}

class FoodMenuAttributes {
  String id;
  String name;
  String image;
  String description;
  double price;
  List<String> category;
  double rating;
  List<FeedbackModel> feedbacks;
  String restaurentName;
  String restaurentId;

  FoodMenuAttributes({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.category,
    required this.rating,
    required this.feedbacks,
    required this.restaurentName,
    required this.restaurentId,
  });

  factory FoodMenuAttributes.fromJson(Map<String, dynamic> json) {
    return FoodMenuAttributes(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      category: List<String>.from(json['category']),
      rating: (json['rating'] as num).toDouble(),
      feedbacks: json['feedbacks'] != null
          ? List<FeedbackModel>.from(
              json['feedbacks'].map((x) => FeedbackModel.fromJson(x)),
            )
          : [],
      restaurentName: json['restaurentName'],
      restaurentId: json['restaurentId'],
    );
  }
}

class FeedbackModel {
  String id;
  String sender;
  double rating;
  String comment;
  String? image;
  String? video;
  String? createdAt;
  String? updatedAt;
  String reviewerName;
  String reviewerImage;
  String reviewerId;

  FeedbackModel({
    required this.id,
    required this.sender,
    required this.rating,
    required this.comment,
    this.image,
    this.video,
    this.createdAt,
    this.updatedAt,
    required this.reviewerName,
    required this.reviewerImage,
    required this.reviewerId,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['_id'],
      sender: json['sender'],
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'],
      image: json['image'],
      video: json['video'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      reviewerName: json['reviewerName'],
      reviewerImage: json['reviewerImage'],
      reviewerId: json['reviewerId'],
    );
  }
}
