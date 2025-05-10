import 'dart:async'; // <--- important for Timer
import 'package:flutter/material.dart';
import 'package:palette/assets_paths/image_path.dart';
import 'package:palette/authuntication/new_password.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonWidgets.dart';

class EnterOtpPage extends StatefulWidget {
  const EnterOtpPage({super.key});

  @override
  State<EnterOtpPage> createState() => _EnterOtpPageState();
}

class _EnterOtpPageState extends State<EnterOtpPage> {
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());

  late Timer _timer;
  int _start = 55;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void startTimer() {
    _canResend = false;
    _start = 55;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _canResend = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  TextEditingController emailController = TextEditingController();

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
              AppAssetsPath.verified,
            ),
            const SizedBox(height: 40),

            // Title
            commonText("Code has been sent to\nuser@example.com",
                size: 21, isBold: true, textAlign: TextAlign.center),

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

            // Countdown / Resend Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!_canResend)
                  commonText(
                    "Resend code in $_start s",
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
                          // TODO: Implement resend logic here
                          startTimer(); // Restart the timer again after resend
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
            ),

            const Spacer(),

            // Send Reset Link Button
            commonButton(
              "Verify OTP",
              onTap: () {
                navigateToPage(SetNewPasswordPage());
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
