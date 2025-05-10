import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonDesigns.dart';
import 'package:palette/follow/add_new_log_page.dart';
import 'package:palette/follow/post_details.dart';

import '../commonWidgets.dart';

class MyPaletteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          leading: commonBackButton(),
          title: commonText("My Palette",
              size: 20, color: AppColors.white, isBold: true),
          centerTitle: true,
        ),
        bottomSheet: Column(
          children: [
            SizedBox(height: 16),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  _buildLogsTab(context),
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
                      {
                        "text":
                            "A delightful experience! The dessert was a highlight, rich and decadent.",
                        "rating": 4,
                        "time": "3 Days Ago"
                      },
                      {
                        "text":
                            "An unforgettable dining experience! Every dish was meticulously crafted.",
                        "rating": 5,
                        "time": "5 Hours Ago"
                      },
                    ],
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
              Tab(text: "Logs"),
              Tab(text: "Reviews"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogsTab(BuildContext context) {
    return Column(
      children: [
        Expanded(child: buildLogs()),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 40,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                // Navigate to Add New Log Page
                navigateToPage(AddNewLogScreen());
              },
              icon: Icon(
                Icons.add,
                color: AppColors.white,
                size: 24,
              ),
              label: commonText("Add New Log",
                  color: AppColors.white, size: 14, isBold: true),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }

  Widget buildLogs() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              // Navigate to Log Details Page
              navigateToPage(PostDetailsScreen());
            },
            child: buildLogsCardDesign());
      },
    );
  }
}
