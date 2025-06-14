// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/home%20page%20controller/home_controller.dart';
import 'package:palette/models/common_models.dart';
import 'package:palette/utils/helper.dart';
import 'package:palette/views/res/image_path.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonDesigns.dart';
import 'package:palette/views/res/commonWidgets.dart';
import 'package:palette/views/Home/food_details_page.dart';
import 'package:palette/views/Notification/notifications_page.dart';

class HomePage extends StatelessWidget {
  final controller = TextEditingController(); // If needed for search

  final HomeController homeController = Get.put(HomeController());
  UserAttributes userInfo;
  HomePage({super.key, required this.userInfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(userInfo.fullName,
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
                getFullImagePath(userInfo.image)), // Example avatar
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
              Obx(() {
                return SizedBox(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Menu highLight = homeController.highlights[index];
                          return cardDesign(
                            width: 190.0,
                            name: highLight.name,
                            imageUrl: getFullImagePath(highLight.image ??
                                "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1"),
                            buttonName: highLight.category,
                            ratting: highLight.rating.toString(),
                            location: highLight.restaurentName,
                            isleft: true,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 16,
                          );
                        },
                        itemCount: homeController.highlights.length));
              }),

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
              Obx(() {
                if (homeController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (homeController.foryou.isEmpty) {
                  return commonText("No Recommandation Found");
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: homeController.foryou.length,
                  itemBuilder: (context, index) {
                    return _buildLogsCardDesign(
                      card: homeController.foryou[index],
                      ontap: () {
                        navigateToPage(FoodDetailsPage(
                          id: homeController.foryou[index].id,
                        ));
                      },
                    );
                  },
                );
              })
              // Chicken Burger again
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

  Widget _buildLogsCardDesign({
    required Menu card,
    required Function() ontap,
  }) {
    return InkWell(
      onTap: ontap,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                // Image
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
                        image: NetworkImage(getFullImagePath(card.image ??
                            "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1")), // fallback image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Details
                ListTile(
                  title: commonText(card.name, size: 16, isBold: true),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Notes or Category Badge
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: commonText(
                          card.category,
                          size: 14,
                          isBold: true,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 6),

                      // Restaurant info
                      Row(
                        children: [
                          Image.asset(AppAssetsPath.locationIcon),
                          SizedBox(width: 4),
                          commonText(card.restaurentName,
                              size: 12, isBold: true),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.orange),
                  SizedBox(width: 2),
                  commonText(card.rating.toString(), isBold: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
