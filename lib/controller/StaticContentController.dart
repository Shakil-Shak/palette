// lib/controllers/static_content_controller.dart
import 'package:get/get.dart';
import 'package:palette/models/user%20models/static_content_model.dart';
import 'package:palette/repositories/StaticContentRepository.dart';

class StaticContentController extends GetxController {
  final StaticContentRepository staticContentRepository;

  StaticContentController(this.staticContentRepository);

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var staticContentResponse = Rxn<StaticContentResponse>();

  Future<void> fetchStaticContent(String type) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final response = await staticContentRepository.getStaticContent(type);
      staticContentResponse.value = response;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
    }
  }
}
