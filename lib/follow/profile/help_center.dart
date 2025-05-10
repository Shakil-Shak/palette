// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:palette/colors.dart';
import 'package:palette/commonWidgets.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  // Mock data for FAQ
  List<Faq> faqList = [
    Faq(
        title: "How to use the app?",
        content:
            "Worem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus."),
    Faq(
        title: "How to reset password?",
        content:
            "Worem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. "),
    Faq(
        title: "Where can I find support?",
        content:
            "Worem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. "),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: FAQ and Contact us
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
            backgroundColor: AppColors.primary,
            title: commonText(
              'Help Center',
              size: 21,
              isBold: true,
              color: AppColors.white,
            ),
            centerTitle: true,
            leading: commonBackButton()),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicatorColor: AppColors.primary, // Indicator color
              labelColor: AppColors.primary, // Active tab color
              unselectedLabelColor: Colors.black, // Inactive tab color
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold, // Bold text for active tab
                fontSize: 16,
              ),
              tabs: [
                Tab(text: 'FAQ'),
                Tab(text: 'Contact us'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FAQTab(faqList: faqList), // FAQ section with dynamic data
                  const ContactUsTab(), // Contact Us section
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class FAQTab extends StatelessWidget {
  final List<Faq> faqList;
  FAQTab({super.key, required this.faqList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Expanded(
        child: ListView.builder(
          itemCount: faqList.length,
          itemBuilder: (context, index) {
            Faq faq = faqList[index];
            return Card(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: AppColors.primary)),
                child: ExpansionTile(
                  title: commonText(faq.title!,
                      size: 16,
                      color: Colors.black,
                      isBold: true,
                      textAlign: TextAlign.left),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:
                          commonText(faq.content ?? "", size: 14, isBold: true),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ContactUsTab extends StatelessWidget {
  const ContactUsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),

          // Phone Number Button
          ContactButton(
            icon: Icons.phone,
            text: 'Phone Number',
            onTap: () {
              // Add functionality to call or navigate
            },
          ),

          // Email Button
          ContactButton(
            icon: Icons.email,
            text: 'Email',
            onTap: () {
              // Add email functionality
            },
          ),

          // Facebook Button
          ContactButton(
            icon: Icons.facebook,
            text: 'Facebook',
            onTap: () {
              // Open Facebook Page
            },
          ),

          // Instagram Button
          ContactButton(
            icon: Icons.photo_camera_outlined, // Alternative to Instagram icon
            text: 'Instagram',
            onTap: () {
              // Open Instagram Page
            },
          ),
        ],
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ContactButton({
    required this.icon,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 2, color: AppColors.primary)),
          child: ListTile(
            leading: Icon(icon, color: Colors.orange),
            title: commonText(
              text,
              size: 14,
              color: Colors.black,
              textAlign: TextAlign.start,
              isBold: true,
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

class Faq {
  final String? title;
  final String? content;

  Faq({this.title, this.content});
}
