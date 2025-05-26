import 'package:flutter/material.dart';
import 'package:palette/pages/res/colors.dart';
import 'package:palette/pages/res/commonDesigns.dart';
import 'package:palette/pages/res/commonWidgets.dart';

class BadgesScreen extends StatefulWidget {
  const BadgesScreen({super.key});

  @override
  State<BadgesScreen> createState() => _BadgesScreenState();
}

class _BadgesScreenState extends State<BadgesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Badges",
            color: AppColors.white, isBold: true, size: 21),
        centerTitle: true,
        leading: commonBackButton(),
      ),
      backgroundColor: AppColors.primary,
      bottomSheet: Container(
        height: double.infinity,
        padding: EdgeInsets.all(24),
        child: GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
          children: List.generate(
            50,
            (index) {
              return badgesCard(
                  imageUrl:
                      "https://www.nexgenus.com/images/blogs/migrated/2020/1/17/Sales_of_soft_drinks.png",
                  name: "Mixologist");
            },
          ),
        ),
      ),
    );
  }
}
