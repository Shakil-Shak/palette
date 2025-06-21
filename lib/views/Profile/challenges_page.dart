import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/profile%20controller/challenge_controller.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonDesigns.dart';
import 'package:palette/views/res/commonWidgets.dart';

class ChallengesPage extends StatelessWidget {
  final ChallengeController controller = Get.put(ChallengeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: commonBackButton(),
        title: commonText("Challenges",
            size: 20, isBold: true, color: AppColors.white),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return Container(
          padding: const EdgeInsets.only(top: 16),
          decoration: const BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.challenges.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final challenge = controller.challenges[index];
              return challengeCard(challenge); // Your custom widget
            },
          ),
        );
      }),
    );
  }
}
