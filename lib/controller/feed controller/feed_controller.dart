import 'dart:developer';

import 'package:get/get.dart';
import 'package:palette/models/common_models.dart';
import 'package:palette/models/feed%20models/foodies_model.dart';
import 'package:palette/repositories/feed_repository.dart';

class FeedController extends GetxController {
  final FeedRepository _feedRepository = FeedRepository();

  RxList<Foodie> foodieList = <Foodie>[].obs;
  RxBool isLoading = false.obs;
  var logs = <LogEntry>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFoodies();
    fetchLogs();
  }

  void fetchFoodies() async {
    try {
      isLoading.value = true;
      final response = await _feedRepository.getFoodies();
      foodieList.assignAll(response.foodies ?? []);
    } catch (e) {
      print("Error fetching foodies: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void fetchLogs() async {
    try {
      isLoading.value = true;
      final result = await _feedRepository.getLogs();
      logs.assignAll(result.data);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch logs');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> followUnfollow({required int index}) async {
    try {
      final result =
          await _feedRepository.followUnfollow(foodieList[index].id!);
      if (result.statusCode == 200) {
        foodieList[index].isFollow = !foodieList[index].isFollow;
        foodieList.refresh();
      }
    } catch (e) {
      log('Error');
    }
  }
}
