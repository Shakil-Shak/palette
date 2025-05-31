import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/user_controller.dart';
import 'package:palette/views/res/image_path.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxBool isObscuredCurrent = true.obs;
  final RxBool isObscuredNew = true.obs;
  final RxBool isObscuredConfirm = true.obs;

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    // Replace with actual logged-in user email
    final String userEmail = "tushar@gmail.com";

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: commonText(
          "Change Password",
          size: 21,
          isBold: true,
          color: AppColors.white,
        ),
        centerTitle: true,
        leading: commonBackButton(),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildPasswordField(
              "Enter Current Password",
              currentPasswordController,
              isObscured: isObscuredCurrent,
              onVisibilityToggle: () =>
                  isObscuredCurrent.value = !isObscuredCurrent.value,
            ),
            const SizedBox(height: 12),
            _buildPasswordField(
              "New Password",
              newPasswordController,
              isObscured: isObscuredNew,
              onVisibilityToggle: () =>
                  isObscuredNew.value = !isObscuredNew.value,
            ),
            const SizedBox(height: 12),
            _buildPasswordField(
              "Confirm New Password",
              confirmPasswordController,
              isObscured: isObscuredConfirm,
              onVisibilityToggle: () =>
                  isObscuredConfirm.value = !isObscuredConfirm.value,
            ),
            const Spacer(),
            Obx(() {
              if (userController.isLoading.value) {
                return const CircularProgressIndicator();
              }
              return commonButton(
                "Update Password",
                onTap: () {
                  final currentPwd = currentPasswordController.text.trim();
                  final newPwd = newPasswordController.text.trim();
                  final confirmPwd = confirmPasswordController.text.trim();

                  if (currentPwd.isEmpty ||
                      newPwd.isEmpty ||
                      confirmPwd.isEmpty) {
                    commonSnackbar(context, "Please fill all password fields");
                    return;
                  }
                  if (newPwd != confirmPwd) {
                    commonSnackbar(context, "New passwords do not match");
                    return;
                  }

                  userController
                      .changePassword(currentPwd, newPwd, userEmail)
                      .then((_) {
                    if (userController.errorMessage.value.isEmpty) {
                      commonSnackbar(context, "Password changed successfully",
                          backgroundColor: Colors.green);
                      Get.back(); // Close screen on success
                    } else {
                      commonSnackbar(context, userController.errorMessage.value,
                          backgroundColor: Colors.red);
                    }
                  });
                },
                isLoading: userController.isLoading.value,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(
    String hintText,
    TextEditingController controller, {
    required RxBool isObscured,
    required VoidCallback onVisibilityToggle,
  }) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: commonTextfieldWithTitle(
          hintText,
          controller,
          hintText: hintText,
          isPasswordVisible: !isObscured.value,
          changePasswordVisibility: onVisibilityToggle,
          issuffixIconVisible: true,
          assetIconPath: AppAssetsPath.lock,
        ),
      );
    });
  }
}
