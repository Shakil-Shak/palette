import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette/controller/explore_controller.dart';
import 'package:palette/utils/helper.dart';

import 'package:palette/views/Home/food_details_page.dart';
import 'package:palette/views/Home/resturant_details_page.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonDesigns.dart';
import '../res/commonWidgets.dart';

class ExploreScreen extends StatelessWidget {
  final ExploreController controller = Get.put(ExploreController());
  final TextEditingController _searchController = TextEditingController();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          leading: SizedBox(),
          title: commonText("Explore",
              size: 20, color: AppColors.white, isBold: true),
        ),
        bottomSheet: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  _buildListView(),
                  _buildMapView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, top: 16, bottom: 16),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 1,
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TabBar(
            indicator: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.black,
            dividerColor: Colors.transparent,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "List"),
              Tab(text: "Map"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (controller.errorMessage.value != null) {
        return Center(
            child: commonText("Error: ${controller.errorMessage.value}"));
      }

      return ListView(
        padding: EdgeInsets.all(16),
        children: [
          commonSearchBar(
              hintText: "Search Restaurant, Dishes",
              onSubmitted: (value) {
                controller.updateSearch(_searchController.text.trim());
              },
              controller: _searchController),
          SizedBox(height: 16),
          if (controller.topRestaurants.isNotEmpty)
            commonText("Top Rated Restaurants", size: 18, isBold: true),
          SizedBox(height: 12),
          gridSection(
            controller.topRestaurants.map((restaurant) {
              return InkWell(
                onTap: () {
                  navigateToPage(RestaurantDetailsPage(
                    id: restaurant.userId,
                  ));
                },
                child: cardDesign(
                  imageUrl: getFullImagePath(restaurant.image ?? ""),
                  buttonName: restaurant.cuisines.join(", "),
                  ratting: restaurant.rating.toString(),
                  location: restaurant.address,
                  name: restaurant.fullName,
                ),
              );
            }).toList(),
            ration: 0.65,
          ),
          SizedBox(height: 16),
          if (controller.topMenus.isNotEmpty)
            commonText("Top Rated Items", size: 18, isBold: true),
          SizedBox(height: 12),
          gridSection(
            controller.topMenus.map((menu) {
              return InkWell(
                onTap: () {
                  navigateToPage(FoodDetailsPage(
                    id: menu.id,
                  ));
                },
                child: cardDesign(
                  imageUrl: getFullImagePath(menu.image ?? ""),
                  buttonName: menu.category,
                  ratting: menu.rating.toString(),
                  location: menu.restaurentAddress,
                  name: menu.name,
                  isleft: false,
                ),
              );
            }).toList(),
            ration: 0.9,
          ),
        ],
      );
    });
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

  Widget _buildMapView() {
    return Container(
      color: Colors.grey.shade200,
      child: Center(
        child: Image.asset(
          "assets/images/map.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
