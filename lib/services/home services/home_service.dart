import 'dart:io';

import 'package:palette/models/home%20models/ads_monetization_model.dart';
import 'package:palette/models/home%20models/feedback_by_restaurent_id.dart';
import 'package:palette/models/home%20models/for_you_model.dart';
import 'package:palette/models/home%20models/gallery_by_restaurant_id.dart';
import 'package:palette/models/home%20models/hightlight_model.dart';
import 'package:palette/models/home%20models/menu_by_restaurent_id_model.dart';
import 'package:palette/models/home%20models/menu_details_model.dart';
import 'package:palette/models/home%20models/restaurant_details_model.dart';
import 'package:palette/models/home%20models/submit_feedback_model.dart';
import 'package:palette/services/api_service.dart';
import 'package:palette/utils/api_endpoints.dart';

class HomeService {
  final ApiService apiService = ApiService();

  Future<ForYouResponse> fetchForYou() async {
    final jsonResponse = await apiService.get(ApiEndpoints.forYou);
    return ForYouResponse.fromJson(jsonResponse);
  }

  Future<HighLightsResponse> fetchHighLights() async {
    final jsonResponse = await apiService.get(ApiEndpoints.highlights);
    return HighLightsResponse.fromJson(jsonResponse);
  }

  Future<FoodMenuDetailsResponse> fetchMenuDetailsByid(String id) async {
    final jsonResponse = await apiService.get(ApiEndpoints.getMenuDetails(id));
    return FoodMenuDetailsResponse.fromJson(jsonResponse);
  }

  Future<AdsMonetizationResponse> fetchAds() async {
    final jsonResponse = await apiService.get(ApiEndpoints.ads);
    return AdsMonetizationResponse.fromJson(jsonResponse);
  }

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

  Future<RestaurantDetailsResponse> fetchRestaurantDetailsByid(
      String id) async {
    final jsonResponse =
        await apiService.get(ApiEndpoints.getRestaurantDetails(id));
    return RestaurantDetailsResponse.fromJson(jsonResponse);
  }

  Future<MenuByRestaurantIdResponse> fetchMenuRestaurantByid(String id) async {
    final jsonResponse =
        await apiService.get(ApiEndpoints.getMenuByRestaurantId(id));
    return MenuByRestaurantIdResponse.fromJson(jsonResponse);
  }

  Future<GalleriesByRestautentIdResponse> fetchGalleryRestaurantByid(
      String id) async {
    final jsonResponse =
        await apiService.get(ApiEndpoints.getGarallyByRestaurantId(id));
    return GalleriesByRestautentIdResponse.fromJson(jsonResponse);
  }

  Future<FeedbackByRestaurantIdResponse> fetchFeedbackRestaurantByid(
      String id) async {
    final jsonResponse =
        await apiService.get(ApiEndpoints.getFeedbackRestaurantId(id));
    return FeedbackByRestaurantIdResponse.fromJson(jsonResponse);
  }
}
