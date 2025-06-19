class FoodieListResponse {
  String? status;
  int? statusCode;
  String? message;
  List<Foodie>? foodies;
  List<dynamic>? errors;

  FoodieListResponse({
    this.status,
    this.statusCode,
    this.message,
    this.foodies,
    this.errors,
  });

  factory FoodieListResponse.fromJson(Map<String, dynamic> json) {
    return FoodieListResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      errors: json['errors'],
      foodies: (json['data']?['attributes'] as List<dynamic>?)
          ?.map((e) => Foodie.fromJson(e))
          .toList(),
    );
  }
}

class Foodie {
  String? id;
  String? fullName;
  String? image;
  int? logsCount;

  Foodie({
    this.id,
    this.fullName,
    this.image,
    this.logsCount,
  });

  factory Foodie.fromJson(Map<String, dynamic> json) {
    return Foodie(
      id: json['_id'],
      fullName: json['fullName'],
      image: json['image'],
      logsCount: json['logsCount'] != null
          ? int.tryParse(json['logsCount'].toString())
          : null,
    );
  }
}
