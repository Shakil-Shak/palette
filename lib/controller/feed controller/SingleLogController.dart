import 'package:get/get.dart';
import 'package:palette/models/common_models.dart';
import 'package:palette/repositories/feed_repository.dart';

class SingleLogController extends GetxController {
  String id;
  SingleLogController(this.id);
  final FeedRepository _feedRepository = FeedRepository();

  Rx<LogEntry?> logEntry = Rx<LogEntry?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLogById(id);
  }

  Future<void> fetchLogById(String id) async {
    try {
      isLoading.value = true;
      final result =
          await _feedRepository.getALogDetails(id); // Ensure this method exists
      logEntry.value = result.data;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch log details');
    } finally {
      isLoading.value = false;
    }
  }
}
