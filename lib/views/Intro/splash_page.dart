import 'dart:async';
import 'package:flutter/material.dart';
import 'package:palette/views/Onboarding/onboarding_page.dart';
import 'package:palette/views/res/image_path.dart';

import 'package:palette/views/res/commonWidgets.dart';

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
      navigateToPage(OnboardingScreen());
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
