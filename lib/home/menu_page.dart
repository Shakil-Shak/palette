import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonDesigns.dart';
import 'package:palette/commonWidgets.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            commonText("Menus", size: 21, isBold: true, color: AppColors.white),
        leading: commonBackButton(),
      ),
      backgroundColor: AppColors.primary,
      bottomSheet: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return menuCard();
          },
        ),
      ),
    );
  }
}
