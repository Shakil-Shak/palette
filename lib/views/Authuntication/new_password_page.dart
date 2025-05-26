import 'package:flutter/material.dart';
import 'package:palette/views/res/image_path.dart';
import 'package:palette/views/Authuntication/sign_in_page.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
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
