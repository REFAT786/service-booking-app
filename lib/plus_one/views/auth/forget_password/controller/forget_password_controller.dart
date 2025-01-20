import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../repository/auth_repository.dart';
import '../screen/select_platform_for_otp_screen.dart';

class ForgetPasswordController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final emailController = TextEditingController();
  // Store fetched user data
  String? phone;
  String? email;

  bool isLoading = false;

  void checkEmailExistence() async {
    email = emailController.text.trim();
    if (email!.isEmpty) {
      Get.snackbar('Error', 'Please enter your email address.');
      return;
    }
    isLoading = true;
    update();

    try {

      if (email == null) {
        Get.snackbar("Error", "Email is missing. Please try again.");
        return;
      }
      final response = await _authRepository.isEmailExist(email!);

      if (response["success"]) {

        // Store fetched email and phone
        phone = response["data"]["phone"];
        email = response["data"]["email"];

        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $phone");
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $email");
        print("Successful");
         Get.to(SelectPlatformForOtpScreen());
      } else {
        Get.snackbar("Error", "Email not found. Please try again.");
      }
    } catch (e) {
      Get.snackbar("Error", 'Failed to validate email. Please try again.');
    } finally {
      isLoading = false;
      update();
    }
  }

}
