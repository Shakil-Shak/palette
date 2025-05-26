import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:palette/pages/res/image_path.dart';
import 'package:palette/pages/res/colors.dart';
import 'package:palette/pages/res/commonWidgets.dart'; // Assuming commonWidgets.dart includes commonTextfieldWithTitle, commonButton, etc.
import 'package:palette/pages/controllers/ChangePasswordController.dart'; // Assuming this is the controller for change password functionality.

class ChangePasswordScreen extends StatelessWidget {
  final ChangePasswordController controller =
      Get.put(ChangePasswordController());

  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            // Current Password Field
            _buildPasswordField(
              "Enter Current Password",
              controller.currentPasswordController.value,
              isObscured: controller.isObscuredCurrent,
              onVisibilityToggle: () {
                controller.isObscuredCurrent.value =
                    !controller.isObscuredCurrent.value;
              },
            ),
            const SizedBox(height: 12),

            // New Password Field
            _buildPasswordField(
              "New Password",
              controller.newPasswordController.value,
              isObscured: controller.isObscuredNew,
              onVisibilityToggle: () {
                controller.isObscuredNew.value =
                    !controller.isObscuredNew.value;
              },
            ),
            const SizedBox(height: 12),

            // Confirm New Password Field
            _buildPasswordField(
              "Confirm New Password",
              controller.confirmPasswordController.value,
              isObscured: controller.isObscuredConfirm,
              onVisibilityToggle: () {
                controller.isObscuredConfirm.value =
                    !controller.isObscuredConfirm.value;
              },
            ),
            Spacer(),

            // Update Password Button
            commonButton(
              "Update Password",
              onTap: () {
                controller.changePasswordApiCall();
                Get.back();
              },
              isLoading: controller.loading.value,
            ),
          ],
        ),
      ),
    );
  }

  // Builds the password field with visibility toggle
  Widget _buildPasswordField(
    String hintText,
    TextEditingController controller, {
    required RxBool isObscured,
    required VoidCallback onVisibilityToggle,
  }) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: commonTextfieldWithTitle(hintText, controller,
            hintText: hintText,
            isPasswordVisible: !isObscured.value,
            changePasswordVisibility: onVisibilityToggle,
            issuffixIconVisible: true,
            assetIconPath: AppAssetsPath.lock),
      ),
    );
  }
}
