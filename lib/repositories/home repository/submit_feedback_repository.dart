import 'dart:io';
import 'package:palette/models/home%20models/submit_feedback_model.dart';
import 'package:palette/services/home%20services/submit_feed_service.dart';

class SubmitFeedbackRepository {
  final SubmitFeedBackService _homeService = SubmitFeedBackService();
  Future<FeedbackResponse> submitFoodFeedback({
    required String menuId,
    required String comment,
    required int rating,
    File? image,
    File? video,
  }) {
    return _homeService.submitFoodFeedback(
      menuId: menuId,
      comment: comment,
      rating: rating,
      image: image,
      video: video,
    );
  }
}
