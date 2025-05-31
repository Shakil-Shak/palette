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

    // Add data as JSON string field named 'data'
    request.fields['data'] = jsonEncode(data);

    if (profileImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath('profileImage', profileImage.path),
      );
    }

    if (coverImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath('coverImage', coverImage.path),
      );
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
