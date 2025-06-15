import 'dart:io';
import 'package:palette/models/home%20models/submit_feedback_model.dart';

import 'package:palette/services/api_service.dart';
import 'package:palette/utils/api_endpoints.dart';

class SubmitFeedBackService {
  final ApiService apiService = ApiService();

  Future<FeedbackResponse> submitFoodFeedback({
    required String menuId,
    required String comment,
    required int rating,
    File? image,
    File? video,
  }) async {
    final response = await apiService.postMultipart(
      url: ApiEndpoints.submitFeedback,
      fields: {
        'menu': menuId,
        'comment': comment,
        'rating': rating.toString(),
      },
      imageFile: image,
      videoFile: video,
    );
    return FeedbackResponse.fromJson(response);
  }
}
