import 'package:flutter/material.dart';
import 'package:palette/assets_paths/image_path.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonDesigns.dart';
import 'package:palette/commonWidgets.dart';
import 'package:palette/home/give_review.dart';
import 'package:palette/home/resturant_details.dart';
import 'package:palette/home/review_page.dart';

class FoodDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(24)),
                  child: Image.network(
                    "https://www.pennlive.com/resizer/v2/ZL54C3EDKFGWLJY7XRAZPDU4LQ.jpg?auth=2a7815790f3b62ed7b10ac63e852c4fc1f619bae52ea35d1a36ca5a3e8ab14c4&width=1280&quality=90",
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                commonBackButton(),
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
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border,
                              color: AppColors.primary),
                          label: commonText("Add To Favourite",
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
                          navigateToPage(ReviewPage());
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
