import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/repositories/user_repository.dart';
import 'package:palette/services/api_service.dart';
import 'package:palette/services/user_service.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonDesigns.dart';
import 'package:palette/views/res/commonWidgets.dart';
import 'package:palette/views/Profile/badges_page.dart';
import 'package:palette/views/Profile/challenges_page.dart';
import 'package:palette/views/Profile/favorites_page.dart';
import 'package:palette/views/Feed/followers_page.dart';
import 'package:palette/views/Feed/following_page.dart';
import 'package:palette/views/Profile/my_palette_page.dart';
import 'package:palette/views/Profile/profile_settings_page.dart';
import 'package:palette/views/Profile/top_rated_iteams_page.dart';
import 'package:palette/models/challenge_data_model.dart';

import '../../controller/user_controller.dart';

class ProfilePage extends StatelessWidget {
  final List badges = [
    {
      "image":
          "https://www.nexgenus.com/images/blogs/migrated/2020/1/17/Sales_of_soft_drinks.png",
      "name": "Mixologist"
    },
    {
      "image":
          "https://www.nexgenus.com/images/blogs/migrated/2020/1/17/Sales_of_soft_drinks.png",
      "name": "Sweet Tooth"
    },
    {
      "image":
          "https://www.nexgenus.com/images/blogs/migrated/2020/1/17/Sales_of_soft_drinks.png",
      "name": "Taco Titan"
    },
    {
      "image":
          "https://www.nexgenus.com/images/blogs/migrated/2020/1/17/Sales_of_soft_drinks.png",
      "name": "Pizza Pro"
    },
  ];

  final List<ChallengeData> challenges = [
    ChallengeData(
        title: "Breakfast Champion",
        subtitle: "Log 10 breakfast items",
        completed: 7),
    ChallengeData(
        title: "Lunch Leader", subtitle: "Log 10 lunch items", completed: 8),
    ChallengeData(
        title: "Dinner Dynamo", subtitle: "Log 10 dinner items", completed: 9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: commonText("Profile",
            size: 21, isBold: true, color: AppColors.white),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile info
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                    'https://www.w3schools.com/w3images/avatar2.png'),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      commonText("Sarah Johnson", size: 18, isBold: true),
                      SizedBox(width: 6),
                      Icon(Icons.verified, color: Colors.blueAccent, size: 18)
                    ],
                  ),
                  SizedBox(height: 4),
                  commonSmallButton(
                    text: "Explorer Palette",
                    width: 120,
                    borderWidth: 0,
                    color: AppColors.primary,
                    textColor: AppColors.white,
                  ),
                  SizedBox(height: 8),
                  commonSmallButton(
                    text: "Profile Settings",
                    ontap: () {
                      Get.put(UserController(
                          UserRepository(UserService(ApiService()))));

                      navigateToPage(ProfileSettingsPage());
                    },
                    width: 110,
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Followers/Following
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        // Navigate to Followers Page
                        navigateToPage(FollowersPage());
                      },
                      child: profileStat("450", "Followers")),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                      width: 1,
                      height: 40,
                      color: AppColors.black.withOpacity(0.5)),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                      onTap: () {
                        navigateToPage(FollowingPage());
                      },
                      child: profileStat("287", "Following")),
                ],
              ),
              SizedBox(height: 24),

              // Badges Section
              sectionHeader(
                "Badges",
                ontap: () {
                  navigateToPage(BadgesPage());
                },
              ),
              SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: badges.length,
                  separatorBuilder: (_, __) => SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return badgesCard(
                      imageUrl: badges[index]['image'],
                      name: badges[index]['name'],
                    );
                  },
                ),
              ),
              SizedBox(height: 24),

              // Current Challenges
              sectionHeader("Current Challenges", ontap: () {
                // Navigate to Challenges Page
                navigateToPage(ChallengesPage());
              }),

              SizedBox(height: 12),
              Column(
                children: challenges
                    .map((challenge) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: challengeCard(challenge),
                        ))
                    .toList(),
              ),
              SizedBox(height: 24),

              // Menu Items
              menuItem(
                "My Palette",
                ontap: () {
                  // Navigate to My Palette Page
                  navigateToPage(MyPalettePage());
                },
              ),
              menuItem(
                "Top Rated Items",
                ontap: () {
                  // Navigate to Top Rated Items Page
                  navigateToPage(TopRatedItemsPage());
                },
              ),
              menuItem(
                "Favorites",
                ontap: () {
                  // Navigate to Favorites Page
                  navigateToPage(FavoritesPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileStat(String count, String label) {
    return Column(
      children: [
        commonText(count, size: 18, isBold: true),
        SizedBox(height: 4),
        commonText(label, size: 14, color: AppColors.black, isBold: true),
      ],
    );
  }

  Widget sectionHeader(String title, {required Function()? ontap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        commonText(title, size: 16, isBold: true),
        InkWell(onTap: ontap, child: commonText("View All", isBold: true)),
      ],
    );
  }

  Widget menuItem(
    String label, {
    required Function()? ontap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: commonText(label, size: 16, isBold: true),
      trailing: Icon(Icons.chevron_right),
      onTap: ontap,
    );
  }
}
