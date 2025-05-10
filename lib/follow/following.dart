import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonWidgets.dart';

// Assume you already have AppColors, commonSearchBar, commonSmallButton, commonText defined as you posted.

class FollowingPage extends StatelessWidget {
  FollowingPage({super.key});

  final List<Map<String, dynamic>> followersList = [
    {'name': 'Lisa', 'username': '@its_jessi', 'isFollowing': true},
    {'name': 'John', 'username': '@johnnyboy', 'isFollowing': true},
    {'name': 'Mia', 'username': '@miamazing', 'isFollowing': true},
    {'name': 'Tom', 'username': '@tom_the_great', 'isFollowing': true},
    {'name': 'Nina', 'username': '@nina_ninja', 'isFollowing': true},
    {'name': 'Alex', 'username': '@alexander101', 'isFollowing': true},
    {'name': 'Emma', 'username': '@emma_rocks', 'isFollowing': true},
    {'name': 'Chris', 'username': '@chriscool', 'isFollowing': true},
    {'name': 'Sophie', 'username': '@sophie_sparkle', 'isFollowing': true},
    {'name': 'Jake', 'username': '@jake_the_snake', 'isFollowing': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      // light pinkish background
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: commonBackButton(),
        centerTitle: true,
        title: commonText(
          'Following',
          size: 21,
          color: AppColors.white,
          isBold: true,
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: commonSearchBar(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: followersList.length,
                itemBuilder: (context, index) {
                  final follower = followersList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: const NetworkImage(
                              'https://www.w3schools.com/w3images/avatar2.png'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonText(
                                follower['name'],
                                size: 14,
                                isBold: true,
                              ),
                              const SizedBox(height: 4),
                              commonText(
                                follower['username'],
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                        commonSmallButton(
                          text: follower['isFollowing'] ? 'Unfollow' : 'Follow',
                          ontap: () {
                            // You can implement follow/unfollow logic here
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
