import 'dart:async';
import 'package:get/get.dart';
import 'package:service_booking_app/plus_one/features/auth/choose_interest/screen/choose_interest_screen.dart';
import '../../../../repository/auth_repository.dart';
import '../../create_new_password/screen/create_new_passport_screen.dart';

class OtpController extends GetxController {
  final AuthRepository authRepository = AuthRepository();

  bool isSignUp = false; // Indicates the source of navigation
  bool isLoading = false;
  bool showResendButton = false;
  String otpCode = '';
  static String token = '';
  int remainingTime = 60;
  Timer? timer;

  // Starts the resend timer
  void startResendTimer() {
    remainingTime = 60;
    showResendButton = false;
    update();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        update();
      } else {
        showResendButton = true;
        timer.cancel();
        update();
      }
    });
  }

  // Stops the timer (used during cleanup)
  void stopTimer() {
    timer?.cancel();
  }

  // Verifies the OTP
  // Verifies the OTP
  Future<void> verifyOtp() async {
    if (otpCode.length < 6) {
      Get.snackbar("Error", "Please enter a valid 6-digit OTP.");
      return;
    }

    isLoading = true;
    update();

    try {
      final response = isSignUp
          ? await authRepository.verifyOtp(otpCode, token)
          : await authRepository.verifyOtpForForgetPassword(otpCode, token);

      if (response["success"]) {
        if (isSignUp) {
          final newToken = response["data"];
          Get.offAll(() => ChooseInterestScreen(), arguments: {'token': newToken});
        } else {
          final newToken = response["data"]["forgetOtpMatchToken"];
          Get.offAll(() => CreateNewPassportScreen(), arguments: {'token': newToken});
        }
      } else {
        Get.snackbar("Error", response["message"] ?? "Invalid OTP. Please try again.");
      }
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred. Please try again.");
    } finally {
      isLoading = false;
      update();
    }
  }

  // Resends the OTP for sign up and forget passwords
  Future<void> resendOtp() async {
    isLoading = true;
    update();

    try {
      final response = await authRepository.resendOtp(otpCode ,token);
      print("OTP Resent Successfully: $response");
      Get.snackbar("Success", "OTP has been resent.");
      startResendTimer();
    } catch (e) {
      print("Resend OTP Failed: $e");
      Get.snackbar("Error", "Failed to resend OTP. Please try again.");
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Retrieve `isSignUp` and `token` from arguments
    isSignUp = Get.arguments?['isSignUp'] ?? false;
    token = Get.arguments?['token'] ?? '';
    startResendTimer();
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }
}
