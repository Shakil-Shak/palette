import 'package:flutter/material.dart';
import 'package:palette/assets_paths/image_path.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonWidgets.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: commonBackButton(),
      ),
      backgroundColor: AppColors.primary,
      bottomSheet: Container(
        padding: EdgeInsets.all(16),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                    minHeight: 350,
                    maxHeight: MediaQuery.sizeOf(context).width * 0.9),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              commonText("Miso Ramen", size: 18, isBold: true),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Image.asset(AppAssetsPath.locationIcon),
                  Flexible(child: commonText("Ichiran", size: 14, isBold: true))
                ],
              ),
              SizedBox(
                height: 4,
              ),
              commonText(
                  "Tried the miso ramen and wow — deep umami, rich but not too heavy, with just the right spicy kick. Noodles were on point, chashu melted in my mouth. 10/10 comfort food vibes. 👌🔥",
                  size: 16,
                  isBold: true)
            ],
          ),
        ),
      ),
    );
  }
}
