// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/auth_controller.dart';
import 'package:palette/views/res/image_path.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';

class EnterOtpPage extends StatelessWidget {
  EnterOtpPage({super.key, required this.isEmailVerified, required this.email});
  bool isEmailVerified;
  String email;

  final List<TextEditingController> otpControllers =
      List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    late final AuthController authController;

    authController = Get.put(AuthController());
    authController.startOtpTimer(); // start countdown on page load

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        leading: commonBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Image.asset(AppAssetsPath.verified),
            const SizedBox(height: 40),
            commonText(
              "Code has been sent to\n${email}",
              size: 21,
              isBold: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child:
                      buildOTPTextField(otpControllers[index], index, context),
                );
              }),
            ),
            const SizedBox(height: 8),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!authController.canResend.value)
                    commonText(
                      "Resend code in ${authController.countdown.value} s",
                      size: 14,
                      color: AppColors.black,
                      isBold: true,
                    )
                  else
                    Row(
                      children: [
                        commonText("Didn't receive code? ",
                            size: 14, color: AppColors.black, isBold: true),
                        InkWell(
                          onTap: () {
                            authController.resendOtp(email,
                                isEmailVerification: isEmailVerified);
                          },
                          child: commonText(
                            "Resend Code",
                            size: 14,
                            color: AppColors.primary,
                            isBold: true,
                          ),
                        ),
                      ],
                    ),
                ],
              );
            }),
            const Spacer(),
            Obx(() {
              if (authController.isVerifyingOtp.value) {
                return const CircularProgressIndicator();
              }
              return commonButton(
                "Verify OTP",
                onTap: () {
                  String otp = otpControllers.map((c) => c.text).join();
                  if (otp.length < 6) {
                    commonSnackbar(context, "Please enter complete OTP");
                    return;
                  }
                  authController.verifyOtp(email, otp, isEmailVerified);
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
