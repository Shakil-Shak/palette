import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonDesigns.dart';
import 'package:palette/commonWidgets.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Reviews",
            size: 21, isBold: true, color: AppColors.white),
        leading: commonBackButton(),
      ),
      backgroundColor: AppColors.primary,
      bottomSheet: Padding(
        padding: EdgeInsets.all(16),
        child: buildReviews(reviews: [
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
        ]),
      ),
    );
  }
}
