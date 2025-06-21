import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/feed%20controller/feed_controller.dart';
import 'package:palette/utils/helper.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonDesigns.dart';
import 'package:palette/views/res/commonWidgets.dart';
import 'package:palette/views/Feed/person_details_page.dart';
import 'package:palette/views/Feed/post_details_page.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});
  final FeedController _controller = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        leading: SizedBox(),
        title:
            commonText("Feed", size: 21, isBold: true, color: AppColors.white),
      ),
      bottomSheet: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText("Foodies to Follow", size: 16, isBold: true),
              SizedBox(
                height: 16,
              ),
              Obx(() {
                return _controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 150,
                        child: ListView.separated(
                          separatorBuilder: (_, __) => SizedBox(width: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: _controller.foodieList.length,
                          itemBuilder: (context, index) {
                            final foodie = _controller.foodieList[index];
                            return InkWell(
                              onTap: () {
                                navigateToPage(PersonDetailsPage(
                                    id: foodie.id ??
                                        "")); // adjust if you have ID
                              },
                              child: profileFolllowdesign(
                                imageUrl: foodie.image ?? "",
                                name: foodie.fullName ?? "User",
                                index: index,
                                feedController: _controller,
                                numberOfPost: "${foodie.logsCount ?? 0}",
                              ),
                            );
                          },
                        ),
                      );
              }),
              SizedBox(
                height: 16,
              ),
              commonText("Posts", size: 16, isBold: true),
              SizedBox(
                height: 16,
              ),
              Obx(() {
                return _controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: _controller.logs.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              navigateToPage(PostDetailsPage(
                                id: _controller.logs[index].id,
                              ));
                            },
                            child: buildPostCardDesign(
                                menuImagePath:
                                    _controller.logs[index].image ?? "",
                                profileImage:
                                    _controller.logs[index].user.image,
                                profileName:
                                    _controller.logs[index].user.fullName,
                                name: _controller.logs[index].itemName ?? "",
                                ratting:
                                    _controller.logs[index].rating.toString(),
                                resturant: _controller.logs[index].restaurent,
                                time: getTimeDifference(_controller
                                    .logs[index].createdAt
                                    .toString())),
                          );
                        },
                      );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget profileFolllowdesign(
      {required String imageUrl,
      required String name,
      required FeedController feedController,
      required int index,
      required String numberOfPost}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl),
        ),
        commonText(name, size: 14, isBold: true),
        commonText("$numberOfPost Posts"),
        commonSmallButton(
            text: (feedController.foodieList[index].isFollow)
                ? "Unfollow"
                : "Follow",
            ontap: () {
              feedController.followUnfollow(index: index);
            },
            borderWidth: 0,
            color: AppColors.primary,
            width: 80,
            icon: Icon(
              Icons.add,
              color: AppColors.white,
              size: 16,
            ),
            textColor: AppColors.white,
            haveIcon: true)
      ],
    );
  }
}
