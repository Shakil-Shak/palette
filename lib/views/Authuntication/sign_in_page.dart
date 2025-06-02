import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palette/controller/auth_controller.dart';
import '../res/colors.dart';
import '../res/commonWidgets.dart';
import '../res/image_path.dart';
import 'forget_password_page.dart';
import 'sign_up_page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController =
      TextEditingController(text: "tushar@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "hello1234");

  final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isRememberMeChecked = ValueNotifier<bool>(false);

  late final AuthController authController;

  @override
  Widget build(BuildContext context) {
    authController = Get.put(AuthController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppAssetsPath.logo, height: 150),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                          child:
                              commonText("Sign in Your Account", isBold: true)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              commonTextfieldWithTitle(
                "Email",
                hintText: "Email",
                emailController,
                assetIconPath: AppAssetsPath.email,
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<bool>(
                valueListenable: isPasswordVisible,
                builder: (context, visible, _) {
                  return commonTextfieldWithTitle(
                    "Password",
                    hintText: "Password",
                    isPasswordVisible: visible,
                    issuffixIconVisible: true,
                    changePasswordVisibility: () {
                      isPasswordVisible.value = !visible;
                    },
                    passwordController,
                    assetIconPath: AppAssetsPath.lock,
                  );
                },
              ),
              Row(
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: isRememberMeChecked,
                    builder: (context, checked, _) {
                      return Checkbox(
                        value: checked,
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected))
                            return AppColors.primary;
                          return Colors.transparent;
                        }),
                        onChanged: (value) {
                          isRememberMeChecked.value = !checked;
                        },
                      );
                    },
                  ),
                  commonText("Remember me",
                      size: 14, color: AppColors.black, isBold: true),
                ],
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (authController.isLoading.value)
                  return const CircularProgressIndicator();

                return commonButton(
                  onTap: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      commonSnackbar(
                          context, "Please enter email and password");
                      return;
                    }

                    authController.signIn(email, password);
                  },
                  "Sign In",
                );
              }),
              Obx(() {
                if (authController.errorMessage.isNotEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    commonSnackbar(context, authController.errorMessage.value,
                        backgroundColor: Colors.red);
                    authController.errorMessage.value = '';
                  });
                }
                return const SizedBox.shrink();
              }),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  navigateToPage(ForgetPasswordPage());
                },
                child: commonText("Forgot the password?",
                    size: 14, color: AppColors.black, isBold: true),
              ),
              const SizedBox(height: 30),
              commonText("or continue with",
                  size: 14, color: AppColors.black, isBold: true),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // TODO: Add Google Sign In logic
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: Colors.black38, width: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    AppAssetsPath.googleIcon,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  text: "Don’t have an account? ",
                  style: GoogleFonts.sora(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: "Sign up",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          navigateToPage(SignUpPage());
                        },
                      style: GoogleFonts.sora(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
