import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/home%20page%20controller/submit_feedback_controller.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';

class GiveFoodReviewPage extends StatelessWidget {
  final String menuId;
  const GiveFoodReviewPage({super.key, required this.menuId});

  @override
  Widget build(BuildContext context) {
    final SubmitFeedbackController controller =
        Get.put(SubmitFeedbackController());

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: commonText("Give Review", size: 20, isBold: true),
        leading: commonBackButton(),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Obx(() => Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (i) {
                    final index = i + 1;
                    return IconButton(
                      onPressed: () =>
                          controller.rating.value = index.toDouble(),
                      icon: Icon(
                        controller.rating.value >= index
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.orange,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    maxLines: 5,
                    controller: controller.reviewController,
                    decoration: InputDecoration(
                      hintText: 'Write a review....',
                      filled: true,
                      fillColor: Color(0xFFFBDCDC),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 2),
                      ),
                    ),
                  ),
                ),
                if (controller.selectedMedia.value != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: controller.mediaType.value == 'image'
                        ? Image.file(controller.selectedMedia.value!,
                            height: 100)
                        : Icon(Icons.videocam, size: 60, color: Colors.orange),
                  ),
                if (controller.mediaType.value == null ||
                    controller.mediaType.value == 'image') ...[
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton.icon(
                      onPressed: controller.mediaType.value == 'video'
                          ? null
                          : controller.pickImage,
                      icon: const Icon(Icons.camera_alt, color: Colors.white),
                      label: commonText('Add Photo',
                          color: Colors.white, isBold: true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                commonText("or", size: 14, isBold: true),
                const SizedBox(height: 8),
                if (controller.mediaType.value == null ||
                    controller.mediaType.value == 'video') ...[
                  SizedBox(
                    height: 30,
                    child: ElevatedButton.icon(
                      onPressed: controller.mediaType.value == 'image'
                          ? null
                          : controller.pickVideo,
                      icon: const Icon(Icons.play_circle_fill,
                          color: Colors.white),
                      label: commonText('Add Video',
                          color: Colors.white, isBold: true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                      ),
                    ),
                  ),
                ],
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Obx(() => controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : commonButton("Submit Review",
                          height: 40,
                          onTap: () =>
                              controller.submitReview(menuId: menuId))),
                ),
              ],
            )),
      ),
    );
  }
}
