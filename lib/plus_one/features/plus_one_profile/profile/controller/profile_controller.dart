import 'dart:io';

import 'package:get/get.dart';
import 'package:service_booking_app/plus_one/features/auth/login/controller/loginController.dart';

import '../../../../../helper/prefs_helper.dart';
import '../../../auth/login/screen/login_screen.dart';

class ProfileController extends GetxController{

  String profileImage = '';
  String profileName = '';
  String profileEmail = '';
  bool isLoading = false;

  void loadUserData() async {
    isLoading = true;
    update();

    try {
      profileName = LoginController.fullName;
      profileEmail = LoginController.email;
      profileImage = LoginController.image;
    } catch (e) {
      print("Error loading user data: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  // Logout Functionality
  Future<void> logout() async {
    PrefsHelper.clear();
    // Navigate to LoginScreen
    Get.offAll(() => LoginScreen());
  }

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

}