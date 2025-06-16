import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/home%20page%20controller/restaurant_details_controller.dart';
import 'package:palette/utils/helper.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';

class PhotosPage extends StatelessWidget {
  final String restaurantId;

  const PhotosPage({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final RestaurantDetailsController controller =
        Get.put(RestaurantDetailsController(restaurantId));
    controller.fetchGallery(restaurantId); // API call
    return Scaffold(
      appBar: AppBar(
        title: commonText("Photos",
            size: 21, isBold: true, color: AppColors.white),
        leading: commonBackButton(),
      ),
      backgroundColor: AppColors.primary,
      bottomSheet: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            if (controller.isLoadingGallery.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.galleryList.isEmpty) {
              return Center(child: commonText("No photos available", size: 16));
            }

            return GridView.builder(
              itemCount: controller.galleryList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final imageUrl = controller.galleryList[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    getFullImagePath(imageUrl), // helper to make full URL
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
