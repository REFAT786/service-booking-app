import 'package:get/get.dart';
import 'package:service_booking_app/utils/app_string.dart';

import '../../../../repository/auth_repository.dart';
import '../../otp/controller/otp_controller.dart';
import '../../otp/screen/otp_screen.dart';
import 'forget_password_controller.dart';

class SelectPlatformForOtpController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final ForgetPasswordController forgetPasswordController = Get.find();

  // Get email and phone from ForgetPasswordController
  String? get phone => forgetPasswordController.phone;
  String? get email => forgetPasswordController.email;
  String selectedOption = '';

  void selectOption(String option) {
    selectedOption = option;
    print(
        ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$selectedOption");
    update(); // Refresh UI
  }

  Future<void> proceedToOtp() async {
    if (selectedOption.isEmpty) {
      Get.snackbar("Error", "Please select an option");
      return;
    }

    try {
      if (selectedOption == AppString.email) {
        // Send OTP to email
        if (email != null) {
          final response = await _authRepository.sendOtpToEmail(email!);
          print("Email OTP response: $response");

          if (response["success"]) {
            print("OTP sent successfully via email.");
            OtpController.token = response["data"]["forgetToken"];
            Get.to(() => OtpScreen(), arguments: {'isSignUp': false, 'token': OtpController.token});
          } else {
            Get.snackbar("Error", response["message"] ?? "Failed to send OTP.");
          }
        } else {
          Get.snackbar("Error", "Email is missing.");
        }
      }
      else {
        // Send OTP to phone
        if (phone != null) {

          /*
          final response = await _authRepository.sendOtpToPhone(phone!);
          print("Phone OTP response: $response");

          if (response["success"]) {
            print("OTP sent successfully via phone.");
            Get.to(() => OtpScreen());
          } else {
            Get.snackbar("Error", response["message"] ?? "Failed to send OTP.");
          }
           */

        } else {
          Get.snackbar("Error", "Phone number is missing.");
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
