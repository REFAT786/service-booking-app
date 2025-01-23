import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/plus_one/repository/auth_repository.dart';

import '../../otp/controller/otp_controller.dart';
import '../../otp/screen/otp_screen.dart';


class SignUpController extends GetxController {

  final AuthRepository authRepository = AuthRepository();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final selectedOption = "".obs; // Default selection
  final isLoading = false.obs;

  void updateSelectedOption(String? value) {
    if (value != null) {
      selectedOption.value = value;
      print(selectedOption.value);
    }
  }

  Future<void> registerUser() async {

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    final role = selectedOption.value;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || role.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    isLoading.value = true;

    try {
      final response = await authRepository.registerUser(
        email,
        password,
        role,
      );
      //print("email : ${email}\n");
      //print("password : ${password}\n");
      //print("role : ${role}");
      //print("Registration Success: $response");
      OtpController.token = response["data"]["createUserToken"];

      Get.off(OtpScreen(), arguments: {'isSignUp': true, 'token': OtpController.token});

    } catch (e) {
      print("Registration Failed: $e");
      Get.snackbar("Error", "Registration failed. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }
}
