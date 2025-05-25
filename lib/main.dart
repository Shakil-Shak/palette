import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/colors.dart';
import 'package:palette/intro/splash_page.dart';

void main() {
  runApp(const MyApp());
}

//hello
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Palette',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: AppColors.backgroundWhite,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
