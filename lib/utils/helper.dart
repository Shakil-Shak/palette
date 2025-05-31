import 'dart:developer';

import 'package:palette/utils/api_endpoints.dart';

String getFullImagePath(String imagePath) {
  log(imagePath);

  if (imagePath.startsWith('http')) {
    return imagePath;
  }
  log('${ApiEndpoints.imageUrl}$imagePath');
  if (imagePath.startsWith('/')) {
    return '${ApiEndpoints.imageUrl}$imagePath';
  }
  return '${ApiEndpoints.imageUrl}$imagePath';
}
