import 'package:get/get.dart';
import 'package:palette/models/feed%20models/personal_details_model.dart';
import 'package:palette/repositories/feed_repository.dart';

class PersonDetailsController extends GetxController {
  final String userId;

  PersonDetailsController({required this.userId});

  final FeedRepository feedRepository = FeedRepository();
  var isLoading = true.obs;
  var userDetails = Rxn<PersonalUserAttributes>();
  var logs = <PrivateLogEntry>[].obs;
  var badgeImages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPersonDetails();
  }

  void fetchPersonDetails() async {
    try {
      isLoading(true);
      final data = await feedRepository.getPersonalDetails(userId);
      userDetails.value = data.data.attributes.first;
      logs.value = data.data.attributes.first.logs;
      badgeImages.value = data.data.attributes.first.badgeImage;
    } catch (e) {
      print("Error fetching details: $e");
    } finally {
      isLoading(false);
    }
  }
}
