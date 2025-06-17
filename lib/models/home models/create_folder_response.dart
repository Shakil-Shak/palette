class CreateFolderResponse {
  final int statusCode;
  final int status;
  final String message;
  final FolderData data;
  final List<dynamic> errors;

  CreateFolderResponse({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory CreateFolderResponse.fromJson(Map<String, dynamic> json) {
    return CreateFolderResponse(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
      data: FolderData.fromJson(json['data']),
      errors: json['errors'] ?? [],
    );
  }
}

class FolderData {
  final String type;
  final FolderAttributes attributes;

  FolderData({required this.type, required this.attributes});

  factory FolderData.fromJson(Map<String, dynamic> json) {
    return FolderData(
      type: json['type'],
      attributes: FolderAttributes.fromJson(json['attributes']),
    );
  }
}

class FolderAttributes {
  final String id;
  final String user;
  final String foldername;
  final String createdAt;
  final String updatedAt;

  FolderAttributes({
    required this.id,
    required this.user,
    required this.foldername,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FolderAttributes.fromJson(Map<String, dynamic> json) {
    return FolderAttributes(
      id: json['_id'],
      user: json['user'],
      foldername: json['foldername'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
