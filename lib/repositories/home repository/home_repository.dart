import 'dart:io';

import 'package:palette/models/home%20models/ads_monetization_model.dart';
import 'package:palette/models/home%20models/for_you_model.dart';
import 'package:palette/models/home%20models/hightlight_model.dart';
import 'package:palette/models/home%20models/menu_details_model.dart';
import 'package:palette/models/home%20models/restaurant_details_model.dart';
import 'package:palette/services/home%20services/home_service.dart';
import 'package:palette/models/home%20models/submit_feedback_model.dart';

class HomeRepository {
  final HomeService _homeService = HomeService();

  Future<ForYouResponse> getForYou() {
    return _homeService.fetchForYou();
  }

  Future<HighLightsResponse> getHighLights() {
    return _homeService.fetchHighLights();
  }

  Future<FoodMenuDetailsResponse> getMenuDetailsById(String id) async {
    return await _homeService.fetchMenuDetailsByid(id);
  }

  Future<AdsMonetizationResponse> getAds() async {
    return await _homeService.fetchAds();
  }

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

  Future<RestaurantDetailsResponse> getRestaurantDetailsById(String id) async {
    return await _homeService.fetchRestaurantDetailsByid(id);
  }
}
