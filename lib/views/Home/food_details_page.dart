// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/home%20page%20controller/food_details_page_controller.dart';

import 'package:palette/views/Home/resturant_details_page.dart';
import 'package:palette/views/res/image_path.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonDesigns.dart';
import 'package:palette/views/res/commonWidgets.dart';
import 'package:palette/views/Home/give_review_page.dart';
import 'package:palette/views/Home/reviews_page.dart';

class FoodDetailsPage extends StatelessWidget {
  String id;

  FoodDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller with the id once.
    final MenuDetailsController controller =
        Get.put(MenuDetailsController(id), tag: id);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food Image
            Stack(
              children: [
                Image.network(
                  "https://static.vecteezy.com/system/resources/previews/023/809/530/non_2x/a-flying-burger-with-all-the-layers-ai-generative-free-photo.jpg",
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 32),
                  child: commonBackButton(),
                ),
              ],
            ),

            // Food Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText("Signature Burger", size: 20, isBold: true),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          navigateToPage(RestaurantDetailsPage());
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_pin,
                                size: 16, color: AppColors.black),
                            SizedBox(width: 4),
                            commonText("Green Eats", size: 14),
                          ],
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      commonText("4.6", size: 14, isBold: true),
                    ],
                  ),
                  SizedBox(height: 12),
                  commonText("\$24.00", size: 18, isBold: true),
                  SizedBox(height: 16),

                  // Description
                  commonText("Description", size: 16, isBold: true),
                  SizedBox(height: 8),
                  commonText(
                    "Juicy beef patty with melted cheddar, caramelized onions, fresh lettuce, and our special sauce on a toasted brioche bun.",
                    size: 14,
                    color: AppColors.gray,
                  ),

                  SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            showAddToFavoriteDialog(context);
                          },
                          icon: Icon(Icons.favorite_border,
                              color: AppColors.primary),
                          label: commonText("Add To Favorite",
                              color: AppColors.primary, isBold: true),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(AppAssetsPath.share),
                          commonText("Share", size: 14, isBold: true)
                        ],
                      )),
                    ],
                  ),

                  SizedBox(height: 24),

                  // Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      commonText("Reviews", size: 16, isBold: true),
                      TextButton(
                        onPressed: () {
                          navigateToPage(ReviewsPage());
                        },
                        child: commonText("See All",
                            size: 14, color: AppColors.primary),
                      ),
                    ],
                  ),
                  buildReviews(reviews: [
                    {
                      "text":
                          "Absolutely delicious! The meat was perfectly cooked and juicy, bursting with flavor in every bite.",
                      "rating": 5,
                      "time": "2 Days Ago"
                    },
                    {
                      "text":
                          "The pasta was good, but it lacked a bit of salt. Overall, a decent meal!",
                      "rating": 3,
                      "time": "1 Day Ago"
                    },
                    {
                      "text":
                          "A delightful experience! The dessert was a highlight, rich and decadent.",
                      "rating": 4,
                      "time": "3 Days Ago"
                    },
                    {
                      "text":
                          "An unforgettable dining experience! Every dish was meticulously crafted.",
                      "rating": 5,
                      "time": "5 Hours Ago"
                    },
                  ], physics: NeverScrollableScrollPhysics(), shrinkWrap: true),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: commonButton("Give Review", onTap: () {
                navigateToPage(GiveReviewPage());
              }),
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
