// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:palette/models/common_models.dart';
import 'package:palette/views/res/image_path.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';
import 'package:palette/views/Explore/explore_page.dart';
import 'package:palette/views/Feed/feed_page.dart';
import 'package:palette/views/Profile/profile_page.dart';
import 'package:palette/views/Home/home_page.dart';

class RootPage extends StatefulWidget {
  UserAttributes userInfo;
  RootPage({Key? key, required this.userInfo});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<String> labels = ['Home', 'Explore', 'Feed', 'Profile'];
  final List<String> icons = [
    AppAssetsPath.home,
    AppAssetsPath.explore,
    AppAssetsPath.feed,
    AppAssetsPath.profile
  ];

  late List<Widget> pages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      HomePage(
        userInfo: widget.userInfo,
      ),
      ExploreScreen(),
      FeedPage(),
      ProfilePage()
    ];
  }

  void _onTap(int index) {
    setState(() => _selectedIndex = index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),

      // Bottom Nav
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, -2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = index == _selectedIndex;
            return GestureDetector(
              onTap: () => _onTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isSelected)
                    Container(
                      width: 50,
                      height: 6,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16))),
                    ),
                  SizedBox(
                    height: 8,
                  ),
                  Image.asset(
                    icons[index],
                    height: 24,
                    width: 24,
                    color: isSelected ? AppColors.primary : AppColors.gray,
                  ),
                  const SizedBox(height: 4),
                  commonText(
                    labels[index],
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? AppColors.primary : AppColors.gray,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
