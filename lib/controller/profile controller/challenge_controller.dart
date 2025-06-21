import 'package:get/get.dart';
import 'package:palette/models/user%20models/UserCurrentChallengeModel.dart';

import 'package:palette/repositories/profile_repository.dart';
import 'package:palette/services/api_service.dart';
import 'package:palette/services/profile_service.dart';

class ChallengeController extends GetxController {
  final ProfileRepository _repository =
      ProfileRepository(ProfileService(ApiService()));

  RxList<SingleChallenge> challenges = <SingleChallenge>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadChallenges();
  }

  Future<void> loadChallenges() async {
    try {
      isLoading.value = true;
      final result = await _repository.getCurrentChallenges();
      challenges.value = result.data.attributes.attributes;
    } catch (e) {
      print('Error loading challenges: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
