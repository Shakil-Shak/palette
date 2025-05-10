import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonWidgets.dart';

class GiveReviewPage extends StatelessWidget {
  const GiveReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController reviewController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: commonText("Give Review", size: 20, isBold: true),
        leading: commonBackButton(),
      ),
      bottomSheet: Column(
        children: [
          const SizedBox(height: 20),
          buildStarRating(2.5),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              maxLines: 5,
              controller: reviewController,
              decoration: InputDecoration(
                hintText: 'Write a review....',
                filled: true,
                fillColor: Color(0xFFFBDCDC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 30,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              label:
                  commonText('Add Photos', color: Colors.white, isBold: true),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              ),
            ),
          ),
          const SizedBox(height: 8),
          commonText("or", size: 14, isBold: true),
          const SizedBox(height: 8),
          SizedBox(
            height: 30,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_circle_fill, color: Colors.white),
              label:
                  commonText('Add Videos', color: Colors.white, isBold: true),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: commonButton("Submit Review", height: 40),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget buildStarRating(double rating) {
    List<Widget> stars = [];

    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(const Icon(Icons.star, color: Colors.orange));
      } else if (i - rating <= 0.5) {
        stars.add(const Icon(Icons.star_half, color: Colors.orange));
      } else {
        stars.add(const Icon(Icons.star_border, color: Colors.orange));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }
}
