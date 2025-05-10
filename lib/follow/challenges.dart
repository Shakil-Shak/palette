import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonDesigns.dart';
import 'package:palette/commonWidgets.dart';
import 'package:palette/model/challenge_data_model.dart';

class ChallengesScreen extends StatelessWidget {
  final List<ChallengeData> challenges = [
    ChallengeData(
        title: "Breakfast Champion",
        subtitle: "Log 10 breakfast items",
        completed: 7),
    ChallengeData(
        title: "Lunch Leader", subtitle: "Log 10 lunch items", completed: 8),
    ChallengeData(
        title: "Dinner Dynamo", subtitle: "Log 10 dinner items", completed: 9),
    ChallengeData(
        title: "Snack Sorcerer", subtitle: "Log 10 snack items", completed: 6),
    ChallengeData(
        title: "Dessert Diva", subtitle: "Log 10 dessert items", completed: 9),
    ChallengeData(
        title: "Beverage Baron",
        subtitle: "Log 10 beverage items",
        completed: 8),
    ChallengeData(
        title: "Appetizer Ace",
        subtitle: "Log 10 appetizer items",
        completed: 7),
    ChallengeData(
        title: "Meal Prep Master",
        subtitle: "Log 10 meal prep ideas",
        completed: 9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: commonBackButton(),
        title: commonText("Challenges",
            size: 20, isBold: true, color: AppColors.white),
        centerTitle: true,
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: challenges.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final challenge = challenges[index];
            return challengeCard(challenge);
          },
        ),
      ),
    );
  }
}
