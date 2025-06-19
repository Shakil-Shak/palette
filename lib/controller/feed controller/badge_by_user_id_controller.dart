import 'package:get/get.dart';
import 'package:palette/models/feed%20models/badges_model.dart';
import 'package:palette/repositories/feed_repository.dart';

class BadgeController extends GetxController {
  final String userId;
  BadgeController(this.userId);

  final FeedRepository _repository = FeedRepository();

  RxBool isLoading = false.obs;
  RxList<BadgeItem> badges = <BadgeItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBadges();
  }

  Future<void> fetchBadges() async {
    try {
      isLoading.value = true;
      final result = await _repository.getALlBadgeByUserId(userId);
      badges.assignAll(result.data.attributes.attributes);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch badges");
    } finally {
      isLoading.value = false;
    }
  }
}
