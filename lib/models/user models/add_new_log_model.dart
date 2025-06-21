class AddNewLogModel {
  final String status;
  final int statusCode;
  final String type;
  final String message;
  final SubmittedLogData data;

  AddNewLogModel({
    required this.status,
    required this.statusCode,
    required this.type,
    required this.message,
    required this.data,
  });

  factory AddNewLogModel.fromJson(Map<String, dynamic> json) {
    return AddNewLogModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      type: json['type'] ?? '',
      message: json['message'] ?? '',
      data: SubmittedLogData.fromJson(json['data']),
    );
  }
}

class SubmittedLogData {
  final String id;
  final String user;
  final String restaurent;
  final String item;
  final String itemName;
  final String? image;
  final String? video;
  final double rating;
  final String notes;
  final String createdAt;
  final String updatedAt;

  SubmittedLogData({
    required this.id,
    required this.user,
    required this.restaurent,
    required this.item,
    required this.itemName,
    this.image,
    this.video,
    required this.rating,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubmittedLogData.fromJson(Map<String, dynamic> json) {
    return SubmittedLogData(
      id: json['_id'] ?? '',
      user: json['user'] ?? '',
      restaurent: json['restaurent'] ?? '',
      item: json['item'] ?? '',
      itemName: json['itemName'] ?? '',
      image: json['image'],
      video: json['video'],
      rating: (json['rating'] as num).toDouble(),
      notes: json['notes'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
