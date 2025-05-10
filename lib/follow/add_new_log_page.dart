import 'package:flutter/material.dart';
import 'package:palette/assets_paths/image_path.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonWidgets.dart';

class AddNewLogScreen extends StatelessWidget {
  final TextEditingController restaurantController = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Assuming soft pink
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: commonText("Add New Log",
            size: 20, isBold: true, color: AppColors.white),
        leading: commonBackButton(),
        centerTitle: true,
      ),
      bottomSheet: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText("Restaurant", size: 14, isBold: true),
            const SizedBox(height: 8),
            commonSearchBar(
              noshadow: true,
              controller: restaurantController,
              hintText: "Search Restaurant",
            ),
            const SizedBox(height: 16),
            commonText("Item", size: 14, isBold: true),
            const SizedBox(height: 8),
            commonSearchBar(
              noshadow: true,
              controller: itemController,
              hintText: "Search Item",
            ),
            const SizedBox(height: 16),
            commonText("Upload Photo", isBold: true, size: 14),
            const SizedBox(height: 8),
            uploadPlaceholderWidget("Click to upload"),
            const SizedBox(height: 16),
            commonText("Upload Video", isBold: true, size: 14),
            const SizedBox(height: 8),
            uploadPlaceholderWidget("Click to upload"),
            const SizedBox(height: 16),
            commonText("Rating", isBold: true, size: 14),
            const SizedBox(height: 8),
            starRatingWidget(initialRating: 3),
            const SizedBox(height: 16),
            commonTextfieldWithTitle("Notes", notesController,
                hintText: "Add Notes about this dish",
                maxLine: 4,
                color: Colors.white,
                borderWidth: 2.0,
                borderColor: AppColors.primary),
            const SizedBox(height: 24),
            commonButton(
              "Post",
              onTap: () {
                // Handle post action
              },
              textalign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget uploadPlaceholderWidget(String text) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssetsPath.upload),
            const SizedBox(height: 4),
            commonText(text, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  Widget starRatingWidget({int initialRating = 3}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          index < initialRating
              ? Icons.star_rounded
              : Icons.star_outline_rounded,
          color: Colors.orange,
          size: 40,
        );
      }),
    );
  }
}
