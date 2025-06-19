import 'dart:developer';

import 'package:get/get.dart';
import 'package:palette/models/feed%20models/all_followers_model.dart';
import 'package:palette/repositories/feed_repository.dart';

class AllFollowersController extends GetxController {
  final FeedRepository _feedRepository = FeedRepository();
  String id;
  AllFollowersController(this.id);
  RxList<FollowerAttributes> followers = <FollowerAttributes>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllFollowers();
  }

  Future<void> fetchAllFollowers() async {
    try {
      isLoading.value = true;
      final result = await _feedRepository
          .getFollowers(id); // make sure this method exists
      followers.value = result.data.attributes;
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error', 'Failed to fetch followers');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> followUnfollow({required int index}) async {
    try {
      final result = await _feedRepository.followUnfollow(followers[index].id);
      if (result.statusCode == 200) {
        followers[index].isFollowing = !followers[index].isFollowing;
        followers.refresh();
      }
    } catch (e) {
      Get.snackbar('Error',
          'Failed to ${followers[index].isFollowing ? "unfollow" : "follow"}');
    }
  }
}
