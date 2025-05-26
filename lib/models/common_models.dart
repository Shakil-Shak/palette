class UserAttributes {
  final String fullName;
  final String email;
  final String image;
  final String role;
  final String id;
  final bool isComplete;
  final bool isBan;
  final String createdAt;
  final String updatedAt;

  UserAttributes({
    required this.fullName,
    required this.email,
    required this.image,
    required this.role,
    required this.id,
    required this.isComplete,
    required this.isBan,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserAttributes.fromJson(Map<String, dynamic> json) {
    return UserAttributes(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      role: json['role'] ?? '',
      id: json['_id'] ?? '',
      isComplete: json['isComplete'] ?? false,
      isBan: json['isBan'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
