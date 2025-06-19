import 'package:get/get.dart';
import 'package:palette/models/feed%20models/all_following_model.dart';
import 'package:palette/repositories/feed_repository.dart';

class AllFollowingController extends GetxController {
  final FeedRepository _feedRepository = FeedRepository();
  String id;
  AllFollowingController(this.id);
  RxList<FollowingAttributes> following = <FollowingAttributes>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllFollowing();
  }

  Future<void> fetchAllFollowing() async {
    try {
      isLoading.value = true;
      final result =
          await _feedRepository.getFollowing(id); // ensure method exists
      following.value = result.data.attributes;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch following');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> followUnfollow({required int index}) async {
    try {
      final result = await _feedRepository.followUnfollow(following[index].id);
      if (result.statusCode == 200) {
        following[index].isFollowing = !following[index].isFollowing;
        following.refresh();
      }
    } catch (e) {
      Get.snackbar('Error',
          'Failed to ${following[index].isFollowing ? "unfollow" : "follow"}');
    }
  }
}
