import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/feed%20controller/badge_by_user_id_controller.dart';
import 'package:palette/utils/helper.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonDesigns.dart';
import 'package:palette/views/res/commonWidgets.dart';

class BadgesPage extends StatelessWidget {
  final String id;
  const BadgesPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BadgeController(id));
    return Scaffold(
      appBar: AppBar(
        title: commonText("Badges",
            color: AppColors.white, isBold: true, size: 21),
        centerTitle: true,
        leading: commonBackButton(),
      ),
      backgroundColor: AppColors.primary,
      bottomSheet: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          height: double.infinity,
          padding: EdgeInsets.all(24),
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
            children: List.generate(
              controller.badges.length,
              (index) {
                return badgesCard(
                    imageUrl:
                        getFullImagePath(controller.badges[index].badgeImage),
                    name: controller.badges[index].challengeTitle);
              },
            ),
          ),
        );
      }),
    );
  }
}
