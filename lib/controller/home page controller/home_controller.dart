import 'package:get/get.dart';
import 'package:palette/models/common_models.dart';
import 'package:palette/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();

  var isLoading = false.obs;
  var errorMessage = RxnString(); // Rxn<String> shorthand
  var foryou = <Menu>[].obs;
  var highlights = <Menu>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchForYou();
    fetchHighLights();
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
}
