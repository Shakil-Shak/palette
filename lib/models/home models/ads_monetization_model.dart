class AdsMonetizationResponse {
  final String status;
  final int statusCode;
  final String message;
  final AdsMonetizationData data;

  AdsMonetizationResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AdsMonetizationResponse.fromJson(Map<String, dynamic> json) {
    return AdsMonetizationResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: AdsMonetizationData.fromJson(json['data']),
    );
  }
}

class AdsMonetizationData {
  final String type;
  final List<AdsMonetization> attributes;

  AdsMonetizationData({
    required this.type,
    required this.attributes,
  });

  factory AdsMonetizationData.fromJson(Map<String, dynamic> json) {
    return AdsMonetizationData(
      type: json['type'],
      attributes: (json['attributes'] as List)
          .map((item) => AdsMonetization.fromJson(item))
          .toList(),
    );
  }
}

class AdsMonetization {
  final String id;
  final String image;
  final String link;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  AdsMonetization({
    required this.id,
    required this.image,
    required this.link,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdsMonetization.fromJson(Map<String, dynamic> json) {
    return AdsMonetization(
      id: json['_id'],
      image: json['image'],
      link: json['link'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
