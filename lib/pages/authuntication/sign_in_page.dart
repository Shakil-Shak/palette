import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palette/pages/res/image_path.dart';
import 'package:palette/pages/authuntication/forget_password.dart';
import 'package:palette/pages/authuntication/sign_up_page.dart';
import 'package:palette/pages/res/colors.dart';
import 'package:palette/pages/res/commonWidgets.dart';
import 'package:palette/pages/root_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isRememberMeChecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool ispasswordVisible = false;
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: FittedBox(
                            child: commonText("Sign in Your Account",
                                isBold: true))),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              commonTextfieldWithTitle(
                  "Email",
                  hintText: "Email",
                  emailController,
                  assetIconPath: AppAssetsPath.email),
              SizedBox(
                height: 16,
              ),
              commonTextfieldWithTitle("Password",
                  hintText: "Password",
                  isPasswordVisible: ispasswordVisible,
                  issuffixIconVisible: true, changePasswordVisibility: () {
                ispasswordVisible = !ispasswordVisible;
                setState(() {});
              }, passwordController, assetIconPath: AppAssetsPath.lock),
              Row(
                children: [
                  Checkbox(
                    value: isRememberMeChecked,
                    fillColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.primary; // Your custom selected color
                      }
                      return Colors.transparent; // Unselected color
                    }),
                    onChanged: (value) {
                      isRememberMeChecked = !isRememberMeChecked;
                      setState(() {});
                    },
                  ),
                  commonText("Remember me",
                      size: 14, color: AppColors.black, isBold: true),
                ],
              ),
              const SizedBox(height: 20),

              // Sign In Button
              commonButton(
                onTap: () {
                  navigateToPage(RootPage());
                },
                "Sign In",
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  navigateToPage(ForgetPasswordPage());
                },
                child: commonText("Forgot the password?",
                    size: 14, color: AppColors.black, isBold: true),
              ),

              const SizedBox(
                height: 30,
              ),
              commonText("or continue with",
                  size: 14, color: AppColors.black, isBold: true),
              const SizedBox(height: 20),

              // Google Sign In Button
              GestureDetector(
                onTap: () {},
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

              const SizedBox(
                height: 30,
              ),
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
