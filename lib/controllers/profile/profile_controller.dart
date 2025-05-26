import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool loading = false.obs;
  RxString profileUrl =
      "https://img.freepik.com/free-photo/portrait-happy-woman-with-digital-tablet_329181-11681.jpg?t=st=1744692216~exp=1744695816~hmac=a0f3a28c4ad7fd7405a0dc70602728b9fd6ac958fd152f187a2dd649522b6936&w=740"
          .obs;
  RxString name = "Unnamed".obs;
  RxString contactNo = "".obs;
  RxString email = "".obs;
  RxString id = "".obs;

  Future<void> profileApiHit() async {}
}
