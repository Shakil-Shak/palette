// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:palette/pages/res/image_path.dart';
import 'package:palette/pages/res/colors.dart';
import 'package:palette/pages/res/commonWidgets.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController =
      TextEditingController(text: "Sarah Johnson");
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Background color
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: commonBackButton(),
        title: commonText(
          "Profile",
          size: 21,
          color: AppColors.white,
          isBold: true,
          textAlign: TextAlign.left,
        ),
        centerTitle: true,
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://steemitimages.com/DQmeTTugWLHCxj4g4gpiJmjtnLAi1zVAZR3G7cWX4iGTiK4/dfg5678.jpg"),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("Edit Profile Image");
                                  // Add image picker functionality here
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset(AppAssetsPath.camera),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://www.w3schools.com/w3images/avatar2.png",
                      ), // Replace with actual image
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Edit Profile Image");
                        // Add image picker functionality here
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(AppAssetsPath.camera),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Name Input Field
            commonTextfieldWithTitle(
              "Name",
              hintText: "Sarah Johnson",
              nameController,
            ),
            SizedBox(
              height: 16,
            ),
            commonTextfieldWithTitle(
              "Phone Number",
              hintText: "123456789",
              phoneController,
            ),
            SizedBox(
              height: 16,
            ),
            commonTextfieldWithTitle(
              "My Details",
              maxLine: 5,
              hintText: "",
              detailsController,
            ),

            const SizedBox(height: 10),

            Spacer(),
            commonButton("Update Profile", onTap: () async {
              if (nameController.text.isEmpty) {
                Get.snackbar("Empty Field", "Name can't be empty");
              } else if (phoneController.text.isEmpty) {
                Get.snackbar("Empty Field", "Phone number can't be empty");
              } else {}
            }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
