import 'package:flutter/material.dart';
import 'package:palette/pages/res/colors.dart';
import 'package:palette/pages/res/commonWidgets.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  final List<String> photoPaths = [
    'https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996',
    "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
    "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
    "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
    'https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996',
    "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
    "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
    "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
    'https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996',
    "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
    "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
    "https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1746426205~exp=1746429805~hmac=22b620c5b6d8e6bba9a9f5363a4f080b47689f9baeecb87f2155a09fee4512ce&w=996",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Photos",
            size: 21, isBold: true, color: AppColors.white),
        leading: commonBackButton(),
      ),
      backgroundColor: AppColors.primary,
      bottomSheet: Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                itemCount: photoPaths.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      photoPaths[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
