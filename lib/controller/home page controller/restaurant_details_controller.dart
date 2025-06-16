import 'package:get/get.dart';
import 'package:palette/models/common_models.dart';
import 'package:palette/models/home%20models/feedback_by_restaurent_id.dart';
import 'package:palette/models/home%20models/restaurant_details_model.dart';
import 'package:palette/repositories/home%20repository/home_repository.dart';

class RestaurantDetailsController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();

  var isLoading = true.obs;
  var restaurantDetails = Rxn<RestaurantAttributes>();
  // Reactive state variables
  var isLoadingMenus = false.obs;
  var isLoadingGallery = false.obs;
  var isLoadingFeedback = false.obs;

  var menuList = <RestaurantMenu>[].obs;
  var galleryList = <String>[].obs;
  var feedbackList = <RestaurentFeedbackItem>[].obs;

  var errorMessage = ''.obs;

  final String id;
  RestaurantDetailsController(this.id);

  Future<void> fetchRestaurantDetails(String id) async {
    try {
      isLoading.value = true;
      final response = await _homeRepository.getRestaurantDetailsById(id);
      restaurantDetails.value = response.data!.attributes;
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch restaurant details");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchMenus(String restaurantId) async {
    try {
      isLoadingMenus.value = true;
      final response =
          await _homeRepository.getMenuByRestaurantId(restaurantId);
      menuList.value = response.data.attributes;
    } catch (e) {
      errorMessage.value = 'Failed to fetch menu: $e';
    } finally {
      isLoadingMenus.value = false;
    }
  }

  Future<void> fetchGallery(String restaurantId) async {
    try {
      isLoadingGallery.value = true;
      final response =
          await _homeRepository.getGalleriesByRestaurantId(restaurantId);
      galleryList.value = response.data.attributes.first.image;
    } catch (e) {
      errorMessage.value = 'Failed to fetch gallery: $e';
    } finally {
      isLoadingGallery.value = false;
    }
  }

  Future<void> fetchFeedback(String restaurantId) async {
    try {
      isLoadingFeedback.value = true;
      final response =
          await _homeRepository.getFeedbackByRestaurantId(restaurantId);
      feedbackList.value = response.data.attributes;
    } catch (e) {
      errorMessage.value = 'Failed to fetch feedback: $e';
    } finally {
      isLoadingFeedback.value = false;
    }
  }
}
