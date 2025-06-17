import 'package:get/get.dart';
import 'package:palette/models/common_models.dart';
import 'package:palette/models/home%20models/ads_monetization_model.dart';
import 'package:palette/models/home%20models/personal_status_model.dart';

import 'package:palette/repositories/home%20repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();

  var isLoading = false.obs;
  var errorMessage = RxnString();
  var foryou = <FoodMenu>[].obs;
  var highlights = <FoodMenu>[].obs;
  var ads = <AdsMonetization>[].obs;
  var userStatus = Rxn<UserStatusResponse>();

  @override
  void onInit() {
    super.onInit();
    fetchForYou();
    fetchHighLights();
    fetchAds();
    fetchUserStatus();
  }

  Future<void> fetchForYou() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final data = await _homeRepository.getForYou();

      foryou.assignAll(data.data); // Assuming data.data is List<ForYou>
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchHighLights() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final data = await _homeRepository.getHighLights();

      highlights.assignAll(data.data); // Assuming data.data is List<ForYou>
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchAds() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final data = await _homeRepository.getAds();
      ads.assignAll(data.data.attributes);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchUserStatus() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final response = await _homeRepository.getUserStatus();
      userStatus.value = response;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
