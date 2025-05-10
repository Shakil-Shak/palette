import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  var isObscuredCurrent = true.obs;
  var isObscuredNew = true.obs;
  var isObscuredConfirm = true.obs;

  var loading = false.obs;

  var currentPasswordController = TextEditingController().obs;
  var newPasswordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;

  void toggleVisibility(RxBool obscuredField) {
    obscuredField.value = !obscuredField.value;
  }

  @override
  void onClose() {
    currentPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
    super.onClose();
  }

  void changePasswordApiCall() async {
    if (currentPasswordController.value.text.isEmpty) {
      Get.snackbar("Empty Field", "Please Enter Your Current Password");
    } else if (newPasswordController.value.text.isEmpty) {
      Get.snackbar("Empty Field", "Please Enter Your New Password");
    } else if (confirmPasswordController.value.text.isEmpty) {
      Get.snackbar("Empty Field", "Please Enter Confirm Password");
    } else {
      loading.value = true;
    }
  }
}
