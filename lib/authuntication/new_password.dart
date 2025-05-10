import 'package:flutter/material.dart';
import 'package:palette/assets_paths/image_path.dart';
import 'package:palette/authuntication/sign_in_page.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonWidgets.dart';

class SetNewPasswordPage extends StatefulWidget {
  const SetNewPasswordPage({super.key});

  @override
  State<SetNewPasswordPage> createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        leading: commonBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Image.asset(
              AppAssetsPath.unlock,
            ),
            const SizedBox(height: 30),

            // Title
            commonText(
              "Create Your New Password",
              size: 21,
              isBold: true,
            ),

            const SizedBox(height: 24),
            commonTextfieldWithTitle("New Password", newPasswordController,
                assetIconPath: AppAssetsPath.lock,
                hintText: "New Password",
                isPasswordVisible: isNewPasswordVisible,
                changePasswordVisibility: () {
              isNewPasswordVisible = !isNewPasswordVisible;
              setState(() {});
            }, issuffixIconVisible: true),
            SizedBox(
              height: 16,
            ),
            commonTextfieldWithTitle(
                "Confirm Password", confirmPasswordController,
                assetIconPath: AppAssetsPath.lock,
                hintText: "Confirm Password",
                isPasswordVisible: isConfirmPasswordVisible,
                changePasswordVisibility: () {
              isConfirmPasswordVisible = !isConfirmPasswordVisible;
              setState(() {});
            }, issuffixIconVisible: true),

            const Spacer(),

            // Send Reset Link Button
            commonButton(
              "Continue",
              onTap: () {
                navigateToPage(SignInPage());
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
