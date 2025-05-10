import 'package:flutter/material.dart';
import 'package:palette/assets_paths/image_path.dart';
import 'package:palette/authuntication/enter_otp.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonWidgets.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.backgroundWhite,
          leading: commonBackButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Image.asset(
              AppAssetsPath.forgetLock,
            ),
            const SizedBox(height: 40),

            // Title
            commonText(
              "Forgot Password?",
              size: 24,
              isBold: true,
            ),
            const SizedBox(height: 10),

            // Subtitle
            commonText(
              "Enter your email to reset your password.",
              size: 16,
            ),
            const SizedBox(height: 30),

            // Email Field
            commonTextfieldWithTitle(
              "Email",
              emailController,
              hintText: "Email",
              assetIconPath: AppAssetsPath.email,
            ),
            Spacer(),

            // Send Reset Link Button
            commonButton(
              "Next",
              onTap: () {
                navigateToPage(EnterOtpPage());
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
