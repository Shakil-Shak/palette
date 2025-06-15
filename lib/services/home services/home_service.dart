import 'package:palette/models/home%20models/ads_monetization_model.dart';
import 'package:palette/models/home%20models/for_you_model.dart';
import 'package:palette/models/home%20models/hightlight_model.dart';
import 'package:palette/models/home%20models/menu_details_model.dart';

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
}
