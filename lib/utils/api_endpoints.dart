class ApiEndpoints {
  static const String baseUrl = 'http://10.0.70.37:8023/api/v1/';

  // Auth endpoints
  static const String signIn = 'auth/local';
  static const String signUp = 'auth/sign-up';
  static const String verifyEmail = 'auth/verify-email';
  static const String forgetPassword = 'auth/forget-password';
  static const String verifyOtp = 'auth/verify-otp';
  static const String resetPassword = 'auth/reset-password';
  static const String changePassword = 'auth/change-password';

  // User endpoints
  static const String updateProfile = 'users/update-profile';
  static const String userDetails = 'users/user-details';
  static const String deleteOwnAccount = 'users/delete-own-account';
}
