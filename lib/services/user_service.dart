// lib/data/services/user_service.dart
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:palette/models/user%20models/change_password_model.dart';
import 'package:palette/models/user%20models/update_user_model.dart';
import 'package:http/http.dart' as http;
import 'package:palette/services/local_storage_service.dart';
import '../../utils/api_endpoints.dart';
import 'api_service.dart';
import 'package:http_parser/http_parser.dart';

class UserService {
  ApiService apiService;

  UserService(this.apiService);

  Future<dynamic> getUserProfile() async {
    final response = await apiService.get(ApiEndpoints.userDetails);
    return response;
  }

  Future<PasswordChangedResponse> changePassword(
      String oldPassword, String newPassword, String userEmail) async {
    final body = {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'userEmail': userEmail,
    };

    final jsonResponse =
        await apiService.patch(ApiEndpoints.changePassword, body);
    return PasswordChangedResponse.fromJson(jsonResponse);
  }

  Future<UserUpdateResponse> updateProfile({
    required Map<String, dynamic> data,
    File? profileImage,
    File? coverImage,
  }) async {
    final uri =
        Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.updateProfile}');
    log('${ApiEndpoints.baseUrl}${ApiEndpoints.updateProfile}');
    final request = http.MultipartRequest('PUT', uri);

    LocalStorageService _localStorage = LocalStorageService();
    request.headers['Authorization'] =
        'Bearer ${await _localStorage.getToken()}';

    request.fields['data'] = jsonEncode(data);

    // Helper function to get MIME type from file extension
    MediaType getMediaType(String path) {
      final ext = path.split('.').last.toLowerCase();
      switch (ext) {
        case 'jpg':
        case 'jpeg':
          return MediaType('image', 'jpeg');
        case 'png':
          return MediaType('image', 'png');
        case 'heic':
          return MediaType('image', 'heic');
        case 'heif':
          return MediaType('image', 'heif');
        default:
          // Default fallback MIME type; you may also throw here if unsupported
          return MediaType('application', 'octet-stream');
      }
    }

    if (profileImage != null) {
      final mimeType = getMediaType(profileImage.path);
      request.files.add(await http.MultipartFile.fromPath(
        'profileImage',
        profileImage.path,
        contentType: mimeType,
      ));
      log('Uploading profile image: ${profileImage.path} with MIME type: $mimeType');
    }

    if (coverImage != null) {
      final mimeType = getMediaType(coverImage.path);
      request.files.add(await http.MultipartFile.fromPath(
        'coverImage',
        coverImage.path,
        contentType: mimeType,
      ));
      log('Uploading cover image: ${coverImage.path} with MIME type: $mimeType');
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    log(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body);
      return UserUpdateResponse.fromJson(json);
    } else {
      throw Exception('Failed to update profile: ${response.body}');
    }
  }
}
