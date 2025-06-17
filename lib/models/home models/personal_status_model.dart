class UserStatusResponse {
  final String status;
  final int statusCode;
  final String message;
  final String type;
  final int favourites;
  final int logThisWeek;
  final String mostVisited;
  final List<dynamic> errors;

  UserStatusResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.type,
    required this.favourites,
    required this.logThisWeek,
    required this.mostVisited,
    required this.errors,
  });

  factory UserStatusResponse.fromJson(Map<String, dynamic> json) {
    final attributes = (json['data']['attributes'] as List).isNotEmpty
        ? json['data']['attributes'][0]
        : {};

    return UserStatusResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      type: json['data']['type'],
      favourites: attributes['favourites'] ?? 0,
      logThisWeek: attributes['logThisWeek'] ?? 0,
      mostVisited: attributes['mostVisited'] ?? '',
      errors: json['errors'] ?? [],
    );
  }
}
