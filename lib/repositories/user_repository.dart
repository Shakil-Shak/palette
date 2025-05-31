// lib/repositories/user_repository.dart
import 'dart:io';

import 'package:palette/models/user%20models/change_password_model.dart';
import 'package:palette/models/user%20models/update_user_model.dart';
import 'package:palette/models/user%20models/user_profile_settings_model.dart';
import 'package:palette/services/user_service.dart';

class UserRepository {
  UserService userService;

  UserRepository(this.userService);

  Future<UserProfileResponse> getUserProfile() async {
    final jsonResponse = await userService.getUserProfile();
    return UserProfileResponse.fromJson(jsonResponse);
  }

  Future<PasswordChangedResponse> changePassword(
      String oldPassword, String newPassword, String userEmail) {
    return userService.changePassword(oldPassword, newPassword, userEmail);
  }

  Future<UserUpdateResponse> updateUserProfile({
    required Map<String, dynamic> updateData,
    File? profileImage,
    File? coverImage,
  }) async {
    return await userService.updateProfile(
      data: updateData,
      profileImage: profileImage,
      coverImage: coverImage,
    );
  }
}
