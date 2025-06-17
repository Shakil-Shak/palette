import 'dart:developer';

import 'package:get/get.dart';
import 'package:palette/models/home%20models/menu_details_model.dart';
import 'package:palette/repositories/home%20repository/home_repository.dart';

class MenuDetailsController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();

  var isLoading = false.obs;
  var errorMessage = RxnString(); // Rxn<String> shorthand
  var menuDetails = Rxn<FoodMenuAttributes>();
  final String id;
  var folderNames = <String>[].obs;
  MenuDetailsController(this.id);

  @override
  void onInit() {
    super.onInit();
    fetchMenu(id);
  }

  void fetchMenu(String id) async {
    try {
      isLoading(true);
      final response = await _homeRepository.getMenuDetailsById(id);
      menuDetails.value = response.data.attributes.first;
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchFolders() async {
    try {
      errorMessage.value = '';

      final response = await _homeRepository.getMyFolders();

      // Extract just the folder names
      folderNames.assignAll(
        response.data.attributes.map((e) => e.foldername).toList(),
      );
    } catch (e) {
      log("Folder Fetch Error: $e");
      errorMessage.value = 'Failed to load folders';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createNewFolder(String name) async {
    try {
      final response = await _homeRepository.createFolder(name);
      folderNames.add(response.data.attributes.foldername);
      Get.snackbar("Success", response.message);
    } catch (e) {
      Get.snackbar("Error", "Failed to create folder: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
