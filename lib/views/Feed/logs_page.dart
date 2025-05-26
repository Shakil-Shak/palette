import 'package:flutter/material.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonDesigns.dart';
import 'package:palette/views/Feed/post_details_page.dart';

import '../res/commonWidgets.dart';

class LogsPage extends StatelessWidget {
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
            title: commonText("Logs",
                size: 20, color: AppColors.white, isBold: true),
            centerTitle: true,
          ),
          bottomSheet: Container(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      navigateToPage(PostDetailsPage());
                    },
                    child: buildLogsCardDesign());
              },
            ),
          )),
    );
  }
}
