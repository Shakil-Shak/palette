import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonDesigns.dart';
import 'package:palette/commonWidgets.dart';

class PersonDetailsScreen extends StatefulWidget {
  const PersonDetailsScreen({super.key});

  @override
  State<PersonDetailsScreen> createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://thumbs.dreamstime.com/z/autumn-nature-landscape-colorful-forest-autumn-nature-landscape-colorful-forest-morning-sunlight-131400332.jpg?ct=jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://www.w3schools.com/w3images/avatar2.png"),
                ),
                Positioned(top: 16, left: 16, child: commonBackButton())
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  commonText("Sophie Bennett", size: 18, isBold: true),
                  commonText("@foodie_sophie", size: 14, isBold: true),
                  commonText(
                      "Food enthusiast and coffee addict.\nAlways on the hunt for the next great\nmeal!",
                      size: 16,
                      isBold: true,
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 4,
                  ),
                  commonSmallButton(
                      text: "Follow",
                      verticalPadding: 10,
                      color: AppColors.primary,
                      haveIcon: true,
                      width: 120,
                      fontSize: 16,
                      textColor: AppColors.white,
                      borderWidth: 0,
                      icon: Icon(
                        Icons.add,
                        color: AppColors.white,
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      profileStat("450", "Followers"),
                      Container(
                        color: AppColors.black.withOpacity(0.3),
                        height: 40,
                        width: 1,
                      ),
                      profileStat("287", "Following"),
                      Container(
                        color: AppColors.black.withOpacity(0.3),
                        height: 40,
                        width: 1,
                      ),
                      profileStat("30", "Logs"),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      commonText("Stats", size: 18, isBold: true),
                    ],
                  ),
                  Row(
                    children: [
                      statsCard("Logs This Week", "12"),
                      SizedBox(
                        width: 16,
                      ),
                      statsCard("Favorite", "12"),
                      SizedBox(
                        width: 16,
                      ),
                      statsCard("Most Visited", "Urban Grill"),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      commonText("Food Logs", size: 18, isBold: true),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildPostCardDesign();
                    },
                  )
                ],
              ),
            )
          ],
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

  Widget statsCard(String label, String count) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Row(
                  children: [
                    commonText(label,
                        size: 14, color: AppColors.gray, isBold: true),
                  ],
                ),
              ),
              SizedBox(height: 4),
              FittedBox(
                  child: Row(children: [
                commonText(count,
                    size: 14, isBold: true, color: AppColors.primary),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
