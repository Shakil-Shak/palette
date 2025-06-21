class UserCurrentChallengeModel {
  final String status;
  final int statusCode;
  final String message;
  final UserChallengeData data;

  UserCurrentChallengeModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory UserCurrentChallengeModel.fromJson(Map<String, dynamic> json) {
    return UserCurrentChallengeModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: UserChallengeData.fromJson(json['data']),
    );
  }
}

class UserChallengeData {
  final ChallengeAttributes attributes;

  UserChallengeData({required this.attributes});

  factory UserChallengeData.fromJson(Map<String, dynamic> json) {
    return UserChallengeData(
      attributes: ChallengeAttributes.fromJson(json['attributes']),
    );
  }
}

class ChallengeAttributes {
  final List<SingleChallenge> attributes;

  ChallengeAttributes({required this.attributes});

  factory ChallengeAttributes.fromJson(Map<String, dynamic> json) {
    var list = (json['attributes'] as List)
        .map((e) => SingleChallenge.fromJson(e))
        .toList();

    return ChallengeAttributes(attributes: list);
  }
}

class SingleChallenge {
  final String id;
  final int progress;
  final String challengeTitle;
  final String challengeDescription;
  final String challengeImage;
  final String challengeId;
  final int requiredSteps;
  final double completionRatio;

  SingleChallenge({
    required this.id,
    required this.progress,
    required this.challengeTitle,
    required this.challengeDescription,
    required this.challengeImage,
    required this.challengeId,
    required this.requiredSteps,
    required this.completionRatio,
  });

  factory SingleChallenge.fromJson(Map<String, dynamic> json) {
    return SingleChallenge(
      id: json['_id'] ?? '',
      progress: json['progress'] ?? 0,
      challengeTitle: json['challengeTitle'] ?? '',
      challengeDescription: json['challengeDescription'] ?? '',
      challengeImage: json['challengeImage'] ?? '',
      challengeId: json['challengeId'] ?? '',
      requiredSteps: json['requiredSteps'] ?? 0,
      completionRatio: (json['completionRatio'] ?? 0).toDouble(),
    );
  }
}
