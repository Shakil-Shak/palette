class StaticContentAttributes {
  final String id;
  final String content;

  StaticContentAttributes({
    required this.id,
    required this.content,
  });

  factory StaticContentAttributes.fromJson(Map<String, dynamic> json) {
    return StaticContentAttributes(
      id: json['_id'] ?? '',
      content: json['content'] ?? '',
    );
  }
}

class StaticContentResponse {
  final String status;
  final int statusCode;
  final String message;
  final StaticContentAttributes attributes;

  StaticContentResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.attributes,
  });

  factory StaticContentResponse.fromJson(Map<String, dynamic> json) {
    return StaticContentResponse(
      status: json['status'] ?? '',
      statusCode: int.tryParse(json['statusCode'].toString()) ?? 0,
      message: json['message'] ?? '',
      attributes: StaticContentAttributes.fromJson(json['data']['attributes']),
    );
  }
}
