import 'package:get/get.dart';
import 'package:palette/models/home%20models/restaurant_details_model.dart';
import 'package:palette/repositories/home%20repository/home_repository.dart';

class RestaurantDetailsController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();

  var isLoading = true.obs;
  var restaurantDetails = Rxn<RestaurantAttributes>();

  final String id;
  RestaurantDetailsController(this.id);

  Future<void> fetchRestaurantDetails(String id) async {
    try {
      isLoading.value = true;
      final response = await _homeRepository.getRestaurantDetailsById(id);
      restaurantDetails.value = response.data.attributes;
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch restaurant details");
    } finally {
      isLoading.value = false;
    }
  }
}
