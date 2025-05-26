import 'package:flutter/material.dart';
import 'package:palette/pages/res/image_path.dart';
import 'package:palette/pages/res/colors.dart';
import 'package:palette/pages/res/commonWidgets.dart';
import 'package:palette/model/challenge_data_model.dart';

Widget badgesCard({required String imageUrl, required String name}) {
  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.primary)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        commonText(name, size: 16, isBold: true, maxline: 1)
      ],
    ),
  );
}

Widget challengeCard(ChallengeData data) {
  double progress = data.completed / 10;

  return Container(
    decoration: BoxDecoration(
      color: AppColors.textFieldColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.primary),
    ),
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commonText(data.title,
                size: 16, isBold: true, color: AppColors.black),
            commonText("${data.completed}/10",
                size: 14, isBold: true, color: AppColors.primary),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white,
            color: AppColors.primary,
            minHeight: 12,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commonText(data.subtitle, size: 12, color: AppColors.gray),
            Row(
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.5),
                  child: Icon(
                    Icons.circle,
                    size: 8,
                    color: index < data.completed
                        ? AppColors.primary
                        : AppColors.gray.withOpacity(0.2),
                  ),
                );
              }),
            )
          ],
        ),
      ],
    ),
  );
}

Widget buildLogsCardDesign() {
  return Container(
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
          subtitle: Row(
            children: [
              Image.asset(AppAssetsPath.locationIcon),
              commonText("Ichiran", size: 12, isBold: true),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.orange, size: 14),
              commonText("5.0", size: 12),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildPostCardDesign() {
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    padding: EdgeInsets.symmetric(horizontal: 2),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 1,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                  "https://www.w3schools.com/w3images/avatar2.png"),
            ),
            title: commonText("Sophie Bennett", size: 16, isBold: true),
            subtitle: commonText(
              "1 Hr Ago",
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1"),
                  fit: BoxFit.cover,
                ))),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: commonText("Miso Ramen", size: 16, isBold: true),
            subtitle: Row(
              children: [
                Image.asset(AppAssetsPath.locationIcon),
                commonText("Ichiran", size: 12, isBold: true),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.orange, size: 14),
                commonText("5.0", size: 12),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget cardDesign(
    {required String name,
    required imageUrl,
    required String buttonName,
    required String ratting,
    bool isleft = true,
    bool isdelete = false,
    required String location}) {
  Widget badge(String label) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: commonText(label, size: 14, isBold: true, color: AppColors.white),
    );
  }

  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              ),
              Positioned(
                top: 8,
                left: (isleft) ? 8 : null,
                right: (isleft) ? null : 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.orange),
                      SizedBox(width: 2),
                      commonText(ratting, isBold: true),
                    ],
                  ),
                ),
              ),
              if (isdelete)
                Positioned(
                  top: 8,
                  left: (isleft) ? null : 8,
                  right: (isleft) ? 8 : null,
                  child: Image.asset(
                    AppAssetsPath.delete,
                    width: 24,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 8),
        commonText(name, size: 16, isBold: true),
        SizedBox(height: 4),
        badge(buttonName),
        SizedBox(height: 4),
        Row(
          children: [
            Image.asset(AppAssetsPath.locationIcon),
            SizedBox(width: 4),
            Expanded(
              child: commonText(location, size: 12, isBold: true),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildReviews(
    {required List<Map<String, dynamic>> reviews,
    bool shrinkWrap = false,
    physics}) {
  return ListView.builder(
    itemCount: reviews.length,
    shrinkWrap: shrinkWrap,
    physics: physics,
    itemBuilder: (context, index) {
      final review = reviews[index];
      return Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.w3schools.com/w3images/avatar2.png"),
                ),
                SizedBox(width: 8),
                commonText("Sarah", size: 16, isBold: true),
                Spacer(),
                Icon(Icons.star, color: Colors.orange, size: 16),
                commonText(review["rating"].toString(), size: 14, isBold: true),
              ],
            ),
            SizedBox(height: 8),
            commonText(review["text"].toString(),
                size: 13, maxline: 5, softwarp: true),
            if (index == 1 || index == 3)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Image.network(
                    height: 100,
                    "https://img.freepik.com/free-photo/big-sandwich-hamburger-burger-with-beef-red-onion-tomato-fried-bacon_2829-5398.jpg?t=st=1745919400~exp=1745923000~hmac=459fe6b5497f46b87ffa40d39b05ddc8cc13f31deed1f65b51305cdd3179a7b6&w=740"),
              ),
            SizedBox(height: 4),
            commonText(review["time"].toString(), size: 14, isBold: true),
          ],
        ),
      );
    },
  );
}

Widget menuCard({Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746353741~exp=1746357341~hmac=3f256e35fbd8df75e123da5537030b1f939ade3d9d0999f5f0e217e0c3bfbfc3&w=996")))),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: commonText('Butter Chicken',
                              size: 16.0, isBold: true)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          commonText('5.0', size: 14.0, color: AppColors.black),
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: commonText("Signature",
                        color: AppColors.white, isBold: true),
                  ),
                  commonText(
                    "Grilled chicken marinated in spices, yogurt, smoky, tender, flavorful.",
                    color: AppColors.black,
                  ),
                  SizedBox(height: 4),
                  commonText("\$4.79",
                      size: 14, color: AppColors.primary, isBold: true),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void showAddToFavoriteDialog(BuildContext context) {
  final TextEditingController _controller = TextEditingController();
  final List<String> favorites = ['Burgers', 'Ramens'];

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Color(0xFFFDFBFA),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  commonText('Add to Favorite',
                      size: 18, isBold: true, color: AppColors.black),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Type',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            filled: true,
                            fillColor: Color(0xFFFFEAE6),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          if (_controller.text.trim().isNotEmpty) {
                            setState(() {
                              favorites.add(_controller.text.trim());
                              _controller.clear();
                            });
                          }
                        },
                        child: Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFA9A2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ...favorites.map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: Color(0xFFFFA9A2), width: 2),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Color(0xFFBA5D4D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
