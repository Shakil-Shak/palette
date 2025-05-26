import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palette/assets_paths/image_path.dart';
import 'package:palette/authuntication/sign_in_page.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonWidgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AppAssetsPath.logo,
                height: 150,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: commonText(
                          "Create your Account",
                          isBold: true,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Email
              commonTextfieldWithTitle(
                "Email",
                emailController,
                hintText: "Email",
                assetIconPath: AppAssetsPath.email,
              ),
              const SizedBox(height: 16),

              // User Name

              commonTextfieldWithTitle(
                "User Name",
                userIdController,
                hintText: "User Name",
                assetIconPath: AppAssetsPath.person,
              ),
              const SizedBox(height: 16),

              // Password
              commonTextfieldWithTitle(
                "Password",
                passwordController,
                hintText: "Password",
                assetIconPath: AppAssetsPath.lock,
                isPasswordVisible: isPasswordVisible,
                issuffixIconVisible: true,
                changePasswordVisibility: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Confirm Password
              commonTextfieldWithTitle(
                "Confirm Password",
                confirmPasswordController,
                hintText: "Confirm password",
                assetIconPath: AppAssetsPath.lock,
                isPasswordVisible: isConfirmPasswordVisible,
                issuffixIconVisible: true,
                changePasswordVisibility: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
              ),
              const SizedBox(height: 16),

              const SizedBox(height: 20),

              // Sign Up Button
              commonButton(
                "Sign Up",
                onTap: () {
                  navigateToPage(SignInPage());
                },
              ),
              const SizedBox(height: 20),

              // Divider Text
              commonText("or continue with",
                  size: 14, color: AppColors.black, isBold: true),
              const SizedBox(height: 20),

              // Google Sign In
              GestureDetector(
                onTap: () {
                  // TODO: Google Sign Up
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

              // Already have an account
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: GoogleFonts.sora(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          navigateToPage(SignInPage());
                        },
                      text: "Sign In",
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
