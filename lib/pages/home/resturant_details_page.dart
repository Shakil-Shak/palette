import 'package:flutter/material.dart';
import 'package:palette/pages/res/image_path.dart';
import 'package:palette/pages/res/colors.dart';
import 'package:palette/pages/res/commonDesigns.dart';
import 'package:palette/pages/res/commonWidgets.dart';
import 'package:palette/pages/home/photos_page.dart';
import 'package:palette/pages/home/food_details_page.dart';
import 'package:palette/pages/home/menus_page.dart';
import 'package:palette/pages/home/reviews_page.dart';

class RestaurantDetailsPage extends StatefulWidget {
  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage>
    with TickerProviderStateMixin {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 45.0),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://www.pennlive.com/resizer/v2/ZL54C3EDKFGWLJY7XRAZPDU4LQ.jpg?auth=2a7815790f3b62ed7b10ac63e852c4fc1f619bae52ea35d1a36ca5a3e8ab14c4&width=1280&quality=90",
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 16,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://tse1.mm.bing.net/th/id/OIP.Vbbf9wPK4tJYzKIMjrxYNAHaFN?rs=1&pid=ImgDetMain"),
                              fit: BoxFit.cover)),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 24),
                  child: commonBackButton(),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText("Sub Urban", size: 22, isBold: true),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      commonText("4.6", size: 14),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: AppColors.black),
                      SizedBox(width: 4),
                      commonText("123 Main St, San Francisco, CA", size: 12),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 14, color: AppColors.black),
                      SizedBox(width: 4),
                      commonText("Open today · 11:00 AM – 10:00 PM", size: 12),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 14, color: AppColors.black),
                      SizedBox(width: 4),
                      commonText("(555) 123-4567", size: 12),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            showAddToFavoriteDialog(context);
                          },
                          icon: Icon(Icons.favorite_border,
                              color: AppColors.primary),
                          label: commonText("Add To Favorite",
                              color: AppColors.primary, isBold: true),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(AppAssetsPath.share),
                            commonText("Share", size: 14, isBold: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _buildTabBar(),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: IndexedStack(
                      key: ValueKey<int>(_currentTabIndex),
                      index: _currentTabIndex,
                      children: [
                        _buildMenuSection(),
                        _buildPhotoSection(),
                        Column(
                          children: [
                            buildReviews(
                                reviews: [
                                  {
                                    "text":
                                        "Absolutely delicious! The meat was perfectly cooked and juicy, bursting with flavor in every bite.",
                                    "rating": 5,
                                    "time": "2 Days Ago"
                                  },
                                  {
                                    "text":
                                        "The pasta was good, but it lacked a bit of salt. Overall, a decent meal!",
                                    "rating": 3,
                                    "time": "1 Day Ago"
                                  },
                                ],
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true),
                            commonButton("View all reviews", onTap: () {
                              navigateToPage(ReviewsPage());
                            }, height: 40, width: 150, borderRadious: 8),
                            SizedBox(height: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
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
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 16),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 1,
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              for (int index = 0; index < 3; index++)
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentTabIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _currentTabIndex == index
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: commonText(
                        ["Menu", "Photos", "Reviews"][index],
                        isBold: true,
                        color: _currentTabIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10),
        commonSearchBar(),
        SizedBox(height: 10),
        menuCard(
          onTap: () {
            navigateToPage(FoodDetailsPage());
          },
        ),
        menuCard(
          onTap: () {
            navigateToPage(FoodDetailsPage());
          },
        ),
        menuCard(
          onTap: () {
            navigateToPage(FoodDetailsPage());
          },
        ),
        SizedBox(
          height: 16,
        ),
        commonButton("View all menus", onTap: () {
          navigateToPage(MenusScreen());
        }, height: 40, width: 150, borderRadious: 8),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppColors.primary),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssetsPath.locationIcon),
              SizedBox(width: 16),
              commonText("Check In"),
            ],
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildPhotoSection() {
    final List<String> photoPaths = [
      'https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996',
      "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
      "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
      "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
    ];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GridView.builder(
            itemCount: photoPaths.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  photoPaths[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          SizedBox(
            height: 16,
          ),
          commonButton("View all photos", onTap: () {
            navigateToPage(PhotosPage());
          }, height: 40, width: 150, borderRadious: 8),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
