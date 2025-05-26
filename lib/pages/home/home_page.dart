import 'package:flutter/material.dart';
import 'package:palette/pages/res/image_path.dart';
import 'package:palette/pages/res/colors.dart';
import 'package:palette/pages/res/commonDesigns.dart';
import 'package:palette/pages/res/commonWidgets.dart';
import 'package:palette/pages/home/food_details_page.dart';
import 'package:palette/pages/home/notifications_page.dart';

class HomePage extends StatelessWidget {
  final controller = TextEditingController(); // If needed for search

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText("Hello Lisa",
                size: 16, isBold: true, color: AppColors.white),
            commonText("What tasty food will you try today?",
                size: 12, color: AppColors.white),
          ],
        ),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=3"), // Example avatar
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Navigate to notifications page
              navigateToPage(NotificationsPage());
            },
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              child: Image.asset(AppAssetsPath.notifications),
            ),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promo Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://www.pennlive.com/resizer/v2/ZL54C3EDKFGWLJY7XRAZPDU4LQ.jpg?auth=2a7815790f3b62ed7b10ac63e852c4fc1f619bae52ea35d1a36ca5a3e8ab14c4&width=1280&quality=90",
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 20),

              // Highlights of the Week
              commonText("Highlights of the Week", size: 16, isBold: true),
              SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          navigateToPage(FoodDetailsPage());
                        },
                        child: cardDesign(
                          name: "Miso Ramen",
                          imageUrl:
                              "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1",
                          buttonName: "Signature",
                          ratting: "5.0",
                          location: "Umi Sushi",
                          isleft: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          navigateToPage(FoodDetailsPage());
                        },
                        child: cardDesign(
                          name: "Miso Ramen",
                          imageUrl:
                              "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1",
                          buttonName: "Signature",
                          ratting: "5.0",
                          location: "Umi Sushi",
                          isleft: true,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Stats Section
              commonText("Your Stats", size: 16, isBold: true),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard("Logs This Week", "12"),
                  _buildStatCard("Favorite", "12"),
                  _buildStatCard(
                    "Most Visited",
                    "Urban Grill",
                  ),
                ],
              ),

              SizedBox(height: 20),

              // For You
              commonText("For You", size: 16, isBold: true),
              SizedBox(height: 12),

              _buildLogsCardDesign(
                ontap: () {
                  navigateToPage(FoodDetailsPage());
                },
              ), // Chicken Burger
              _buildLogsCardDesign(
                ontap: () {
                  navigateToPage(FoodDetailsPage());
                },
              ), // Chicken Burger again
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
  ) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(title, size: 12, isBold: true, color: AppColors.gray),
            SizedBox(height: 4),
            commonText(value, size: 14, isBold: true, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  Widget _buildLogsCardDesign({required Function() ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(8),
              child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1"),
                        fit: BoxFit.cover,
                      ))),
            ),
            ListTile(
              title: commonText("Miso Ramen", size: 16, isBold: true),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: commonText("Signature",
                        size: 14, isBold: true, color: AppColors.white),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Image.asset(AppAssetsPath.locationIcon),
                      commonText("Ichiran", size: 12, isBold: true),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
