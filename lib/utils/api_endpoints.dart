class ApiEndpoints {
  static const String baseUrl = 'http://172.252.13.74:8029/api/v1/';
  static const String imageUrl = 'http://172.252.13.74:8029/';

  // Auth endpoints
  static const String signIn = 'auth/local';
  static const String signUp = 'auth/sign-up';
  static const String verifyEmail = 'auth/verify-email';
  static const String forgetPassword = 'auth/forget-password';
  static const String verifyOtp = 'auth/verify-otp';
  static const String resetPassword = 'auth/reset-password';
  static const String changePassword = 'auth/change-password';
  static const String resendOtp = 'auth/resend-otp';

  // User endpoints
  static const String updateProfile = 'users/update-profile';
  static const String userDetails = 'users/user-details';
  static String staticContents(String type) => 'static-contents?type=$type';

  static const String deleteOwnAccount = 'users/delete-own-account';
}
