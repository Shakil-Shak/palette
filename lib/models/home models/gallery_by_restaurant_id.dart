class GalleriesByRestautentIdResponse {
  final String status;
  final int statusCode;
  final String message;
  final GalleryData data;
  final List<dynamic> errors;

  GalleriesByRestautentIdResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory GalleriesByRestautentIdResponse.fromJson(Map<String, dynamic> json) {
    return GalleriesByRestautentIdResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: GalleryData.fromJson(json['data']),
      errors: json['errors'] ?? [],
    );
  }
}

class GalleryData {
  final String type;
  final List<GalleryItem> attributes;

  GalleryData({
    required this.type,
    required this.attributes,
  });

  factory GalleryData.fromJson(Map<String, dynamic> json) {
    return GalleryData(
      type: json['type'],
      attributes: (json['attributes'] as List)
          .map((item) => GalleryItem.fromJson(item))
          .toList(),
    );
  }
}

class GalleryItem {
  final String id;
  final String user;
  final String createdAt;
  final String updatedAt;
  final List<String> image;

  GalleryItem({
    required this.id,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      id: json['_id'],
      user: json['user'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      image: List<String>.from(json['image']),
    );
  }
}
