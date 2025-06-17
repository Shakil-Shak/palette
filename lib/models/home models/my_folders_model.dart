class FoldersResponse {
  final int status;
  final int statusCode;
  final String message;
  final FolderData data;
  final List<dynamic> errors;

  FoldersResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory FoldersResponse.fromJson(Map<String, dynamic> json) {
    return FoldersResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: FolderData.fromJson(json['data']),
      errors: json['errors'] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'statusCode': statusCode,
        'message': message,
        'data': data.toJson(),
        'errors': errors,
      };
}

class FolderData {
  final String type;
  final List<FolderAttributes> attributes;

  FolderData({
    required this.type,
    required this.attributes,
  });

  factory FolderData.fromJson(Map<String, dynamic> json) {
    var list = (json['attributes'] as List)
        .map((e) => FolderAttributes.fromJson(e))
        .toList();

    return FolderData(
      type: json['type'],
      attributes: list,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'attributes': attributes.map((e) => e.toJson()).toList(),
      };
}

class FolderAttributes {
  final String id;
  final String user;
  final String foldername;
  final String createdAt;
  final String updatedAt;
  final int v;

  FolderAttributes({
    required this.id,
    required this.user,
    required this.foldername,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory FolderAttributes.fromJson(Map<String, dynamic> json) {
    return FolderAttributes(
      id: json['_id'] ?? '',
      user: json['user'] ?? '',
      foldername: json['foldername'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user,
        'foldername': foldername,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };
}
