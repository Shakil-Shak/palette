import 'package:palette/models/home%20models/for_you_model.dart';
import 'package:palette/models/home%20models/hightlight_model.dart';
import 'package:palette/models/home%20models/menu_details_model.dart';
import 'package:palette/services/home_service.dart';

class HomeRepository {
  final HomeService _homeService = HomeService();

  Future<ForYouResponse> getForYou() {
    return _homeService.fetchForYou();
  }

  Future<HighLightsResponse> getHighLights() {
    return _homeService.fetchHighLights();
  }

  Future<MenuDetailsResponse> getMenuDetailsById(String id) async {
    return await _homeService.fetchMenuDetailsByid(id);
  }
}
