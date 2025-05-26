import 'package:flutter/material.dart';
import 'package:palette/pages/res/colors.dart';
import 'package:palette/pages/res/commonDesigns.dart';
import 'package:palette/pages/res/commonWidgets.dart';
import 'package:palette/pages/home/food_details.dart';

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
        child: Column(
          children: [
            commonSearchBar(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        navigateToPage(FoodDetailsPage());
                      },
                      child: menuCard());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
