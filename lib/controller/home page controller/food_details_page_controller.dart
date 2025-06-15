import 'package:get/get.dart';
import 'package:palette/models/home%20models/menu_details_model.dart';
import 'package:palette/repositories/home%20repository/home_repository.dart';

class MenuDetailsController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();

  var isLoading = false.obs;
  var errorMessage = RxnString(); // Rxn<String> shorthand
  var menuDetails = Rxn<FoodMenuAttributes>();
  final String id;
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
}
