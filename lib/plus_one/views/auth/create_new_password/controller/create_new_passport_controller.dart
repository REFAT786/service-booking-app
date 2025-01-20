import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/plus_one/views/auth/login/screen/login_screen.dart';

import '../../../../repository/auth_repository.dart';

class CreateNewPassportController extends GetxController{

  final AuthRepository _authRepository = AuthRepository();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false;
  static String token = '';

  Future<void> resetPassword() async {
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "Both password fields are required.");
      return;
    }

    if (newPassword != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match.");
      return;
    }

    isLoading = true;
    update();

    try {
      final response = await _authRepository.resetPassword(newPassword, confirmPassword, token);

      if (response["success"]) {
        print("Success, Password reset successfully!");
        // Navigate to another screen (e.g., login)
        Get.offAll(LoginScreen());
      } else {
        Get.snackbar("Error", response["message"] ?? "Failed to reset password.");
      }
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred. Please try again.");
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    token = Get.arguments?['token'] ?? '';
  }

}