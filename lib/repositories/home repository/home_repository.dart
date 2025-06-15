import 'package:palette/models/home%20models/ads_monetization_model.dart';
import 'package:palette/models/home%20models/for_you_model.dart';
import 'package:palette/models/home%20models/hightlight_model.dart';
import 'package:palette/models/home%20models/menu_details_model.dart';
import 'package:palette/services/home%20services/home_service.dart';

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
}
