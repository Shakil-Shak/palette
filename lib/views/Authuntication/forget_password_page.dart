import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/auth_controller.dart';
import 'package:palette/views/res/image_path.dart';
import '../res/colors.dart';
import '../res/commonWidgets.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  final TextEditingController emailController = TextEditingController();

  late final AuthController authController;

  @override
  Widget build(BuildContext context) {
    authController = Get.put(AuthController());

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
            commonText(
              "Forgot Password?",
              size: 24,
              isBold: true,
            ),
            const SizedBox(height: 10),
            commonText(
              "Enter your email to reset your password.",
              size: 16,
            ),
            const SizedBox(height: 30),
            commonTextfieldWithTitle(
              "Email",
              emailController,
              hintText: "Email",
              assetIconPath: AppAssetsPath.email,
            ),
            const Spacer(),
            Obx(() {
              if (authController.isLoading.value) {
                return const CircularProgressIndicator();
              }
              return commonButton(
                "Next",
                onTap: () {
                  final email = emailController.text.trim();
                  if (email.isEmpty) {
                    commonSnackbar(context, "Please enter your email");
                    return;
                  }
                  authController.sendForgetPasswordOtp(email);
                },
              );
            }),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
