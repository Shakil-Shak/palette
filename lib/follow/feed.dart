import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonDesigns.dart';
import 'package:palette/commonWidgets.dart';
import 'package:palette/follow/person_details_page.dart';
import 'package:palette/follow/post_details.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
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
              SizedBox(
                height: 150,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 16,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        navigateToPage(PersonDetailsScreen());
                      },
                      child: profileFolllowdesign(
                          imageUrl:
                              "https://www.w3schools.com/w3images/avatar2.png",
                          name: "Jessica",
                          numberOfPost: "20"),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              commonText("Posts", size: 16, isBold: true),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        navigateToPage(PostDetailsScreen());
                      },
                      child: buildPostCardDesign());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileFolllowdesign(
      {required String imageUrl,
      required String name,
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
            text: "Follow",
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
