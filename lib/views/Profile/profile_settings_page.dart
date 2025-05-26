import 'package:flutter/material.dart';
import 'package:palette/views/res/image_path.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';
import 'package:palette/views/Profile/change_password_page.dart';
import 'package:palette/views/Profile/edit_profile_page.dart';
import 'package:palette/views/Profile/help_center_page.dart';
import 'package:palette/views/Profile/privacy_policy_page.dart';
import 'package:palette/views/Profile/terms_and_condition_page.dart';

class ProfileSettingsPage extends StatelessWidget {
  ProfileSettingsPage({super.key});

  // Mock Data for Profile Information
  final String profileImageUrl =
      'https://www.w3schools.com/w3images/avatar2.png'; // Placeholder URL
  final String name = "John Doe";
  final String email = "johndoe@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Background color
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: commonBackButton(), // No back button, keeping it empty
        title: commonText(
          "Profile Settings",
          size: 21,
          isBold: true,
          textAlign: TextAlign.center,
          color: AppColors.white,
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
          children: [
            // Profile Image, Name, and Email
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                const SizedBox(height: 10),
                commonText(name, size: 18, color: Colors.black, isBold: true),
                commonText(email, size: 14, color: Colors.black87),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        profileMenuItem(
                            AppAssetsPath.edit_profile, "Edit Profile",
                            onTap: () {
                          // Navigate to Edit Profile Screen
                          navigateToPage(EditProfilePage());
                        }),
                        const Divider(),
                        profileMenuItem(
                            AppAssetsPath.change_password, "Change Password",
                            onTap: () {
                          // Navigate to Change Password Screen
                          navigateToPage(ChangePasswordScreen());
                        }),
                        const Divider(),
                        profileMenuItem(
                            AppAssetsPath.help_center, "Help Center",
                            onTap: () {
                          // Navigate to Help Center Screen
                          navigateToPage(HelpCenterScreen());
                        }),
                        const Divider(),
                        profileMenuItem(AppAssetsPath.terms_and_condition,
                            "Terms of Service", onTap: () {
                          // Navigate to Terms of Service Screen
                          navigateToPage(TermsOfServiceScreen());
                        }),
                        const Divider(),
                        profileMenuItem(
                            AppAssetsPath.privacy_policy, "Privacy Policy",
                            onTap: () {
                          // Navigate to Privacy Policy Screen
                          navigateToPage(PrivacyPolicyScreen());
                        }),
                        const Divider(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Logout Button
                    InkWell(
                      onTap: () async {
                        // Mock logout behavior
                        // Replace with actual logout logic
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              AppAssetsPath.logout,
                              width: 24,
                            ),
                            const SizedBox(width: 10),
                            commonText("Logout",
                                size: 16, color: Colors.red, isBold: true),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            // Profile Menu Items
          ],
        ),
      ),
    );
  }

  // Profile menu item widget
  Widget profileMenuItem(String iconPath, String text,
      {String? value, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 24,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                children: [
                  commonText(text, size: 14, isBold: true),
                ],
              ),
            ),
            if (value != null) ...[
              commonText(value, size: 14, isBold: true),
              const SizedBox(width: 10),
            ],
            const Icon(Icons.chevron_right, size: 20),
          ],
        ),
      ),
    );
  }
}
