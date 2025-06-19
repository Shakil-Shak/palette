import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/feed%20controller/all_followers_controller.dart';
import 'package:palette/utils/helper.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';

class FollowersPage extends StatelessWidget {
  const FollowersPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final AllFollowersController _controller =
        Get.put(AllFollowersController(id)); // Inject the controller
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: commonBackButton(),
        centerTitle: true,
        title: commonText(
          'Followers',
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

                if (_controller.followers.isEmpty) {
                  return Center(
                      child: commonText('No followers found.',
                          size: 18, isBold: true));
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: _controller.followers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(getFullImagePath(
                                _controller.followers[index].image)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                commonText(
                                  _controller.followers[index].fullName,
                                  size: 14,
                                  isBold: true,
                                ),
                                const SizedBox(height: 4),
                                commonText(
                                  '@${_controller.followers[index].fullName.toLowerCase().replaceAll(' ', '_')}',
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                          Obx(() {
                            return commonSmallButton(
                              text: _controller.followers[index].isFollowing
                                  ? 'Unfollow'
                                  : 'Follow',
                              ontap: () {
                                _controller.followUnfollow(index: index);
                              },
                            );
                          }),
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
