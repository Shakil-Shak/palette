import 'dart:io';

import 'package:palette/models/user%20models/UserCurrentChallengeModel.dart';
import 'package:palette/models/user%20models/add_new_log_model.dart';
import 'package:palette/models/user%20models/change_password_model.dart';
import 'package:palette/models/user%20models/top_reated_iteams_model.dart';
import 'package:palette/models/user%20models/update_user_model.dart';
import 'package:palette/models/user%20models/user_profile.dart';
import 'package:palette/models/user%20models/user_profile_settings_model.dart';
import 'package:palette/services/profile_service.dart';

class ProfileRepository {
  ProfileService userService;

  ProfileRepository(this.userService);

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

  Future<TopRatedItemsModel> fetchTopRatedItems() {
    return userService.getTopRatedItems();
  }

  Future<UserCurrentChallengeModel> getCurrentChallenges() {
    return userService.fetchCurrentChallenges();
  }

  Future<AddNewLogModel> addNewLog({
    required Map<String, dynamic> data,
    File? image,
    File? video,
  }) async {
    // Optional check: Ensure at least one of image or video is provided
    if (image == null && video == null) {
      throw Exception('Either an image or a video must be provided.');
    }

    return await userService.addNewLog(
      data: data,
      image: image,
      video: video,
    );
  }

  Future<MyProfileModel> fetchMyProfile() {
    return userService.getMyProfile();
  }
}
