import 'dart:developer';

import 'package:get/get.dart';
import 'package:palette/models/common_models.dart';
import 'package:palette/repositories/feed_repository.dart';

class FeedsByUserIdController extends GetxController {
  final String id;
  FeedsByUserIdController({required this.id});
  final FeedRepository _feedRepository = FeedRepository();
  RxBool isLoading = false.obs;
  var logs = <LogEntry>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchLogs(id);
  }

  void fetchLogs(String id) async {
    try {
      log(id);
      isLoading.value = true;
      final result = await _feedRepository.getALlLogsByUserId(id);
      logs.assignAll(result.data);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch logs');
    } finally {
      isLoading.value = false;
    }
  }
}
