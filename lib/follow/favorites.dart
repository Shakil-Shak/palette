import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonDesigns.dart';
import 'package:palette/commonWidgets.dart';
import 'package:palette/follow/topic_wise_favorite_page.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: commonBackButton(),
        title: commonText('Favorites',
            size: 21, color: AppColors.white, isBold: true),
        centerTitle: true,
        // To center the title
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionHeader(
                'Ramen',
                ontap: () {
                  navigateToPage(
                    TopicWiseFavoritePage(),
                  );
                },
              ),
              SizedBox(height: 8),
              gridSection(_buildFoodCard(), ration: 0.9),
              SizedBox(height: 24),
              sectionHeader(
                'My Fav Restaurants',
                ontap: () {
                  navigateToPage(
                    TopicWiseFavoritePage(),
                  );
                },
              ),
              SizedBox(height: 8),
              gridSection(_buildRestaurantCard()),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionHeader(String title, {required Function()? ontap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        commonText(title, size: 16, isBold: true),
        InkWell(onTap: ontap, child: commonText('View All', isBold: true)),
      ],
    );
  }

  Widget gridSection(List<Widget> cards, {double ration = 0.7}) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: ration,
      children: cards,
    );
  }

  List<Widget> _buildRestaurantCard() {
    return List.generate(
        4,
        (index) => cardDesign(
              imageUrl:
                  "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1",
              isdelete: true,
              buttonName: "American",
              ratting: "4.6",
              location: "123 Random Street",
              name: "Burger House",
            ));
  }

  List<Widget> _buildFoodCard() {
    return List.generate(
        4,
        (index) => cardDesign(
              imageUrl:
                  "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1",
              isdelete: true,
              buttonName: "Signature",
              ratting: "4.6",
              location: "Umi Sushi",
              name: "Miso Ramen",
              isleft: false,
            ));
  }
}
