import 'package:flutter/material.dart';
import 'package:palette/views/res/image_path.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: commonText("Notification",
            size: 21, isBold: true, color: AppColors.white),
        leading: commonBackButton(),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      bottomSheet: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.all(0),
                leading: Image.asset(AppAssetsPath.notifications),
                title: commonText("Nessa is following you",
                    size: 16, isBold: true, color: AppColors.primary),
                subtitle: commonText("16 minutes ago", isBold: true, size: 14),
              );
            },
          )),
    );
  }
}
