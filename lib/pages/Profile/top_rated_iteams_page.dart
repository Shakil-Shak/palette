import 'package:flutter/material.dart';
import 'package:palette/pages/res/image_path.dart';
import 'package:palette/pages/res/colors.dart';
import 'package:palette/pages/res/commonWidgets.dart';

class TopRatedItemsPage extends StatelessWidget {
  final List<TopRatedItem> items = List.generate(
    10,
    (index) => TopRatedItem(
      image:
          'https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1',
      name: 'Signature Burger',
      restaurant: 'Tony’s Burger',
      rating: 5.0,
      isPinned: index == 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: commonBackButton(),
        title: commonText("Top Rated Items",
            size: 21, isBold: true, color: AppColors.white),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) => itemCard(items[index]),
        ),
      ),
    );
  }

  Widget itemCard(TopRatedItem item) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(item.image,
                  width: 50, height: 50, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(item.name,
                      size: 16,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black),
                  const SizedBox(height: 4),
                  commonText(item.restaurant,
                      size: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w900),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 18),
                const SizedBox(width: 4),
                commonText(item.rating.toStringAsFixed(1),
                    size: 14,
                    color: AppColors.black,
                    fontWeight: FontWeight.w900),
                const SizedBox(width: 12),
                Image.asset(
                  AppAssetsPath.pin,
                  color: item.isPinned ? Colors.red.shade700 : AppColors.gray,
                  width: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TopRatedItem {
  final String image;
  final String name;
  final String restaurant;
  final double rating;
  final bool isPinned;

  TopRatedItem({
    required this.image,
    required this.name,
    required this.restaurant,
    required this.rating,
    this.isPinned = false,
  });
}
