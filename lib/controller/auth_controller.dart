// lib/controllers/auth_controller.dart
import 'dart:async';

import 'package:get/get.dart';
import 'package:palette/models/email_verified_model.dart';
import 'package:palette/models/password_reset_model.dart';
import 'package:palette/models/signin_model.dart';
import 'package:palette/models/signup_model.dart';
import 'package:palette/services/local_storage_service.dart';
import 'package:palette/views/Authuntication/enter_otp_page.dart';
import 'package:palette/views/root_page.dart';
import '../repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository = AuthRepository();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // OTP verification states
  var isVerifyingOtp = false.obs;
  var otpErrorMessage = ''.obs;

  // Timer states for OTP resend
  var canResend = false.obs;
  var countdown = 55.obs;
  Timer? _timer;

  Future<void> signIn(String email, String password) async {
    var user = Rxn<LoginResponse>();
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final response = await authRepository.signIn(email, password);
      user.value = response;
      isLoading.value = false;
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Get.to(RootPage());
      } else {
        errorMessage.value = response.message;
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
    }
  }

  Future<void> signUp(String fullName, String email, String password) async {
    var signupResponse = Rxn<SignupResponse>();
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final response = await authRepository.signUp(fullName, email, password);
      signupResponse.value = response;
      isLoading.value = false;
      if (response.statusCode >= 200 && response.statusCode < 300) {
        LocalStorageService().saveToken(response.data.signUpToken);
        Get.to(EnterOtpPage());
      } else {
        otpErrorMessage.value = response.message;
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
    }
  }

// OTP Timer management
  void startOtpTimer() {
    canResend.value = false;
    countdown.value = 55;

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value == 0) {
        canResend.value = true;
        timer.cancel();
      } else {
        countdown.value--;
      }
    });
  }

  // OTP verification
  Future<void> verifyOtp(String email, String otp) async {
    try {
      isVerifyingOtp.value = true;
      otpErrorMessage.value = '';
      final EmailVerifiedResponse response =
          await authRepository.verifyEmail(email, otp);
      isVerifyingOtp.value = false;
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Get.to(RootPage());
      } else {
        otpErrorMessage.value = response.message;
      }
    } catch (e) {
      isVerifyingOtp.value = false;
      otpErrorMessage.value = e.toString();
    }
  }

  Future<void> resendOtp(String email) async {
    try {
      startOtpTimer();
    } catch (e) {
      otpErrorMessage.value = e.toString();
    }
  }

  Future<void> resetPassword(String email, String newPassword) async {
    var resetPasswordResponse = Rxn<PasswordResetResponse>();
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final response = await authRepository.resetPassword(email, newPassword);
      resetPasswordResponse.value = response;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
    }
  }
}
