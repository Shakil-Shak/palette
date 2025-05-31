import 'package:palette/models/auth%20models/email_verified_model.dart';
import 'package:palette/models/auth%20models/forget_password_model.dart';
import 'package:palette/models/auth%20models/otp_verified_model.dart';
import 'package:palette/models/auth%20models/password_reset_model.dart';
import 'package:palette/models/auth%20models/resend_otp_model.dart';
import 'package:palette/models/auth%20models/signin_model.dart';
import 'package:palette/models/auth%20models/signup_model.dart';
import '../services/auth_service.dart';

class AuthRepository {
  AuthService authService = AuthService();

  Future<LoginResponse> signIn(String email, String password) {
    return authService.login(email, password);
  }

  Future<SignupResponse> signUp(
      String fullName, String email, String password) {
    return authService.signUp(fullName, email, password);
  }

  Future<EmailVerifiedResponse> verifyEmail(String email, String otp,
      {required bool isResendPurpose}) {
    return authService.verifyEmail(email, otp,
        isResendPurpose: isResendPurpose);
  }

  Future<PasswordResetResponse> resetPassword(String email, String password) {
    return authService.resetPassword(email, password);
  }

  Future<ForgetPasswordOtpResponse> sendForgetPasswordOtp(String email) {
    return authService.sendForgetPasswordOtp(email);
  }

  Future<OtpVerifiedResponse> verifyForgetPasswordOtp(String email, String otp,
      {required bool isResendPurpose}) {
    return authService.verifyForgetPasswordOtp(email, otp,
        isResendPurpose: isResendPurpose);
  }

  Future<ResendOtpResponse> resendOtp(String email) {
    return authService.resendOtp(email);
  }
}
