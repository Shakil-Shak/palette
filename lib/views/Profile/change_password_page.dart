// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/views/res/image_path.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isObscuredCurrent = true;
  bool isObscuredNew = true;
  bool isObscuredConfirm = true;

  var loading = false;

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
              currentPasswordController,
              isObscured: isObscuredCurrent,
              onVisibilityToggle: () {
                isObscuredCurrent = !isObscuredCurrent;
              },
            ),
            const SizedBox(height: 12),

            // New Password Field
            _buildPasswordField(
              "New Password",
              newPasswordController,
              isObscured: isObscuredNew,
              onVisibilityToggle: () {
                isObscuredNew = !isObscuredNew;
              },
            ),
            const SizedBox(height: 12),

            // Confirm New Password Field
            _buildPasswordField(
              "Confirm New Password",
              confirmPasswordController,
              isObscured: isObscuredConfirm,
              onVisibilityToggle: () {
                isObscuredConfirm = !isObscuredConfirm;
              },
            ),
            Spacer(),

            // Update Password Button
            commonButton(
              "Update Password",
              onTap: () {
                // changePasswordApiCall();
                Get.back();
              },
              isLoading: loading,
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
    required bool isObscured,
    required VoidCallback onVisibilityToggle,
  }) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: commonTextfieldWithTitle(hintText, controller,
            hintText: hintText,
            isPasswordVisible: !isObscured,
            changePasswordVisibility: onVisibilityToggle,
            issuffixIconVisible: true,
            assetIconPath: AppAssetsPath.lock),
      ),
    );
  }
}
