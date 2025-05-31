import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:palette/controller/StaticContentController.dart';
import 'package:palette/repositories/StaticContentRepository.dart';
import 'package:palette/services/StaticContentService.dart';
import 'package:palette/services/api_service.dart';
import 'package:palette/views/res/colors.dart';
import 'package:palette/views/res/commonWidgets.dart';

class TermsAndServicesScreen extends StatefulWidget {
  const TermsAndServicesScreen({super.key});

  @override
  State<TermsAndServicesScreen> createState() => _TermsAndServicesScreenState();
}

class _TermsAndServicesScreenState extends State<TermsAndServicesScreen> {
  late StaticContentController staticContentController;

  @override
  void initState() {
    super.initState();

    final apiService = ApiService();
    final staticContentService = StaticContentService(apiService);
    final staticContentRepository =
        StaticContentRepository(staticContentService);
    staticContentController =
        Get.put(StaticContentController(staticContentRepository));

    // Fetch terms and conditions content
    staticContentController.fetchStaticContent('terms-of-condition');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: commonBackButton(),
        centerTitle: true,
        title: commonText(
          "Terms and Conditions",
          size: 21,
          isBold: true,
          color: AppColors.white,
        ),
      ),
      body: Obx(() {
        if (staticContentController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (staticContentController.errorMessage.isNotEmpty) {
          return Center(
            child: commonText(
              "Error: ${staticContentController.errorMessage.value}",
              color: Colors.red,
            ),
          );
        }

        final content = staticContentController
                .staticContentResponse.value?.attributes.content ??
            'No content available';

        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Markdown(
            data: content,
            selectable: true,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              p: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
              h1: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              h2: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
              strong: const TextStyle(fontWeight: FontWeight.bold),
              listBullet: const TextStyle(fontSize: 14),
            ),
          ),
        );
      }),
    );
  }
}
