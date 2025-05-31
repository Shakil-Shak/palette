class UserAttributes {
  final String id;
  final String fullName;
  final String email;
  final String image;
  final String coverImage;
  final bool isComplete;
  final bool isBan;
  final String role;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String phoneNumber;
  final String aboutMe;

  UserAttributes({
    required this.id,
    required this.fullName,
    required this.email,
    required this.image,
    required this.coverImage,
    required this.isComplete,
    required this.isBan,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.phoneNumber,
    required this.aboutMe,
  });

  factory UserAttributes.fromJson(Map<String, dynamic> json) {
    return UserAttributes(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      coverImage: json['coverImage'] ?? '',
      isComplete: json['isComplete'] ?? false,
      isBan: json['isBan'] ?? false,
      role: json['role'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      phoneNumber: json['phoneNumber'] ?? '',
      aboutMe: json['aboutme'] ?? '',
    );
  }
}
