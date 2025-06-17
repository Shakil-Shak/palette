import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:palette/models/home%20models/restaurant_details_model.dart';
import 'package:palette/utils/api_endpoints.dart';

String getFullImagePath(String imagePath) {
  if (imagePath.startsWith('http')) {
    return imagePath;
  }
  if (imagePath.startsWith('/')) {
    return '${ApiEndpoints.imageUrl}$imagePath';
  }
  return '${ApiEndpoints.imageUrl}$imagePath';
}

String getMimeSubtype(String path) {
  final ext = path.split('.').last.toLowerCase();
  switch (ext) {
    case 'jpg':
    case 'jpeg':
      return 'jpeg';
    case 'png':
      return 'png';
    case 'heic':
      return 'heic';
    case 'heif':
      return 'heif';
    case 'mp4':
      return 'mp4';
    case 'mov':
      return 'quicktime';
    default:
      return 'octet-stream'; // fallback
  }
}

String getTodayOpenStatus(List<OpenHour> openHours) {
  final today = DateTime.now();
  final dayName = _getDayName(today.weekday); // e.g., "Monday"

  final todayHour = openHours.firstWhere(
    (h) => h.day == dayName,
    orElse: () => OpenHour(
        day: dayName,
        isOpen: false,
        openingTime: '00:00',
        closingTime: '00:00'),
  );

  if (!todayHour.isOpen) {
    return "Closed today";
  }

  final openTime = _formatTime(todayHour.openingTime ?? "");
  final closeTime = _formatTime(todayHour.closingTime ?? "");

  return "Open today · $openTime – $closeTime";
}

String _getDayName(int weekday) {
  const days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  return days[weekday % 7]; // Sunday is 7 in Dart
}

String _formatTime(String time24) {
  final parts = time24.split(":");
  final hour = int.parse(parts[0]);
  final minute = parts.length > 1 ? int.parse(parts[1]) : 0;

  final dt = DateTime(0, 0, 0, hour, minute);
  return TimeOfDay.fromDateTime(dt).format(Get.context!);
}
