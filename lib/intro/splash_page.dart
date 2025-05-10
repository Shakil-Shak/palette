import 'dart:async';
import 'package:flutter/material.dart';
import 'package:palette/assets_paths/image_path.dart';
import 'package:palette/authuntication/sign_in_page.dart';
import 'package:palette/commonWidgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to onboarding after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      navigateToPage(SignInPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Image.asset(
            AppAssetsPath.logo,
          ),
        ),
      ),
    );
  }
}
