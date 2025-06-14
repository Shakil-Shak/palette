import 'package:flutter/material.dart';
import 'package:palette/views/Home/food_details_page.dart';
import 'package:palette/views/Home/resturant_details_page.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonDesigns.dart';
import '../res/commonWidgets.dart';

class ExploreScreen extends StatefulWidget {
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();

  int selectedCuisineIndex = 0;

  final List<String> cuisines = [
    "Italian",
    "Japanese",
    "Chinese",
    "American",
    "Italian",
    "Japanese",
    "Chinese",
    "American"
  ];

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
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        commonSearchBar(
            hintText: "Search Restaurant, Dishes",
            controller: _searchController),
        SizedBox(height: 16),
        _buildCuisineTabs(),
        SizedBox(height: 16),
        commonText("Popular Nearby", size: 18, isBold: true),
        SizedBox(height: 12),
        gridSection(
            List.generate(
                2,
                (index) => InkWell(
                      onTap: () {
                        navigateToPage(FoodDetailsPage(
                          id: "",
                        ));
                      },
                      child: cardDesign(
                        imageUrl:
                            "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1",
                        buttonName: "Signature",
                        ratting: "4.6",
                        location: "Umi Sushi",
                        isleft: false,
                        name: "Miso Ramen",
                      ),
                    )),
            ration: 0.9),
        SizedBox(height: 16),
        commonText("Top Rated Restaurants", size: 18, isBold: true),
        SizedBox(height: 12),
        gridSection(
            List.generate(
                2,
                (index) => InkWell(
                      onTap: () {
                        navigateToPage(RestaurantDetailsPage());
                      },
                      child: cardDesign(
                        imageUrl:
                            "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1",
                        buttonName: "American",
                        ratting: "4.6",
                        location: "123 Random Street",
                        name: "Burger House",
                      ),
                    )),
            ration: 0.65),
        SizedBox(height: 16),
        commonText("Top Rated Items", size: 18, isBold: true),
        SizedBox(height: 12),
        gridSection(
            List.generate(
                2,
                (index) => InkWell(
                      onTap: () {
                        navigateToPage(FoodDetailsPage(
                          id: "",
                        ));
                      },
                      child: cardDesign(
                          imageUrl:
                              "https://dynamic-media.tacdn.com/media/photo-o/2e/d4/44/98/caption.jpg?w=700&h=500&s=1",
                          buttonName: "Signature",
                          ratting: "4.6",
                          location: "Umi Sushi",
                          name: "Miso Ramen",
                          isleft: false),
                    )),
            ration: 0.9),
      ],
    );
  }

  Widget _buildCuisineTabs() {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cuisines.length,
        itemBuilder: (context, index) {
          final isSelected = selectedCuisineIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCuisineIndex = index;
              });
              // Optionally trigger filter logic here
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Center(
                  child: commonText(
                    cuisines[index],
                    color: isSelected ? Colors.white : AppColors.primary,
                    size: 14,
                    isBold: true,
                  ),
                ),
              ),
            ),
          );
        },
      ),
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

  Widget _buildMapView() {
    return Container(
      color: Colors.grey.shade200,
      child: Center(
        child: Image.asset(
          "assets/images/map.png", // Or use GoogleMap widget
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
