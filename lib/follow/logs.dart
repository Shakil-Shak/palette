import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonDesigns.dart';

import '../commonWidgets.dart';

class LogsScreen extends StatelessWidget {
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
          bottomSheet: Container(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return buildLogsCardDesign();
              },
            ),
          )),
    );
  }
}
