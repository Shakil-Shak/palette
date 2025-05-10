import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonDesigns.dart';
import 'package:palette/commonWidgets.dart';

class TopicWiseFavoritePage extends StatefulWidget {
  const TopicWiseFavoritePage({super.key});

  @override
  State<TopicWiseFavoritePage> createState() => _TopicWiseFavoritePageState();
}

class _TopicWiseFavoritePageState extends State<TopicWiseFavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Romens",
            color: AppColors.white, size: 21, isBold: true),
        centerTitle: true,
        leading: commonBackButton(),
      ),
      backgroundColor: AppColors.primary,
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: gridSection(_buildFoodCard(), ration: 0.9),
      ),
    );
  }

  Widget gridSection(List<Widget> cards, {double ration = 0.7}) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: ration,
      children: cards,
    );
  }

  List<Widget> _buildFoodCard() {
    return List.generate(
        8,
        (index) => cardDesign(
              imageUrl:
                  "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1",
              buttonName: "Signature",
              ratting: "4.6",
              location: "Umi Sushi",
              name: "Miso Ramen",
              isleft: false,
            ));
  }
}
