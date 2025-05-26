import 'package:palette/models/email_verified_model.dart';
import 'package:palette/models/password_reset_model.dart';
import 'package:palette/models/signin_model.dart';
import 'package:palette/models/signup_model.dart';
import '../services/auth_service.dart';

class AuthRepository {
  final AuthService authService = AuthService();

  Future<LoginResponse> signIn(String email, String password) {
    return authService.login(email, password);
  }

  Future<SignupResponse> signUp(
      String fullName, String email, String password) {
    return authService.signUp(fullName, email, password);
  }

  Future<EmailVerifiedResponse> verifyEmail(String email, String otp) {
    return authService.verifyEmail(email, otp);
  }

// lib/repositories/auth_repository.dart

  Future<PasswordResetResponse> resetPassword(String email, String password) {
    return authService.resetPassword(email, password);
  }
}
