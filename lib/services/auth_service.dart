import 'package:palette/models/email_verified_model.dart';
import 'package:palette/models/forget_password_model.dart';
import 'package:palette/models/otp_verified_model.dart';
import 'package:palette/models/password_reset_model.dart';
import 'package:palette/models/resend_otp_model.dart';
import 'package:palette/models/signin_model.dart';
import 'package:palette/models/signup_model.dart';
import 'api_service.dart';
import '../utils/api_endpoints.dart';

class AuthService {
  final ApiService apiService = ApiService();

  Future<LoginResponse> login(String email, String password) async {
    final body = {
      'email': email,
      'password': password,
    };

    final jsonResponse = await apiService.post(ApiEndpoints.signIn, body);
    return LoginResponse.fromJson(jsonResponse);
  }

  Future<SignupResponse> signUp(
      String fullName, String email, String password) async {
    final body = {
      'fullName': fullName,
      'email': email,
      'password': password,
    };

    final jsonResponse = await apiService.post(ApiEndpoints.signUp, body);
    return SignupResponse.fromJson(jsonResponse);
  }

  Future<EmailVerifiedResponse> verifyEmail(String email, String otp,
      {required bool isResendPurpose}) async {
    final body = {
      'otp': otp,
      "purpose": (isResendPurpose) ? "resend-otp" : "email-verification"
    };

    final jsonResponse = await apiService.post(ApiEndpoints.verifyEmail, body);
    return EmailVerifiedResponse.fromJson(jsonResponse);
  }

  Future<PasswordResetResponse> resetPassword(
      String email, String password) async {
    final body = {
      'email': email,
      'password': password,
    };

    final jsonResponse =
        await apiService.post(ApiEndpoints.resetPassword, body);
    return PasswordResetResponse.fromJson(jsonResponse);
  }

  Future<ForgetPasswordOtpResponse> sendForgetPasswordOtp(String email) async {
    final body = {
      'email': email,
    };

    final jsonResponse =
        await apiService.post(ApiEndpoints.forgetPassword, body);
    return ForgetPasswordOtpResponse.fromJson(jsonResponse);
  }

  Future<OtpVerifiedResponse> verifyForgetPasswordOtp(String email, String otp,
      {required bool isResendPurpose}) async {
    final body = {
      "email": email,
      "otp": otp,
      "purpose": (isResendPurpose) ? "resend-otp" : "forget-password"
    };

    final jsonResponse = await apiService.post(ApiEndpoints.verifyOtp, body);
    return OtpVerifiedResponse.fromJson(jsonResponse);
  }

  Future<ResendOtpResponse> resendOtp(String email) async {
    final body = {
      'email': email,
    };

    final jsonResponse = await apiService.post(ApiEndpoints.resendOtp, body);
    return ResendOtpResponse.fromJson(jsonResponse);
  }
}
