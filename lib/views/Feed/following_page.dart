import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/feed%20controller/all_following_controller.dart';
import 'package:palette/utils/helper.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';

class FollowingPage extends StatelessWidget {
  FollowingPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final AllFollowingController _controller =
        Get.put(AllFollowingController(id));
    return Scaffold(
      backgroundColor: AppColors.primary,
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
        height: MediaQuery.of(context).size.height * 0.85,
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
              child: Obx(() {
                if (_controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (_controller.following.isEmpty) {
                  return Center(
                      child: commonText("No following users found.",
                          isBold: true, size: 18));
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: _controller.following.length,
                  itemBuilder: (context, index) {
                    final user = _controller.following[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(
                              getFullImagePath(user.image),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                commonText(user.fullName,
                                    size: 14, isBold: true),
                                const SizedBox(height: 4),
                                commonText(
                                  '@${user.fullName.toLowerCase().replaceAll(' ', '_')}',
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                          commonSmallButton(
                            text: user.isFollowing ? 'Unfollow' : 'Follow',
                            ontap: () {
                              _controller.followUnfollow(index: index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
