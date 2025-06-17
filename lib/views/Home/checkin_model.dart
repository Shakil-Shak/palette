class CheckInResponse {
  final String status;
  final int statusCode;
  final String message;
  final CheckInData data;
  final List<dynamic> errors;

  CheckInResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory CheckInResponse.fromJson(Map<String, dynamic> json) {
    return CheckInResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: CheckInData.fromJson(json['data']),
      errors: json['errors'] ?? [],
    );
  }
}

class CheckInData {
  final String type;
  final CheckInAttributes attributes;

  CheckInData({
    required this.type,
    required this.attributes,
  });

  factory CheckInData.fromJson(Map<String, dynamic> json) {
    return CheckInData(
      type: json['type'],
      attributes: CheckInAttributes.fromJson(json['attributes']),
    );
  }
}

class CheckInAttributes {
  final String id;
  final String user;
  final String restaurent;
  final String restaurantName;
  final int count;
  final String createdAt;
  final String updatedAt;

  CheckInAttributes({
    required this.id,
    required this.user,
    required this.restaurent,
    required this.restaurantName,
    required this.count,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CheckInAttributes.fromJson(Map<String, dynamic> json) {
    return CheckInAttributes(
      id: json['_id'] ?? '',
      user: json['user'] ?? '',
      restaurent: json['restaurent'] ?? '',
      restaurantName: json['restaurantName'] ?? '',
      count: json['count'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
