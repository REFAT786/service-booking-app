import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/login/screen/login_screen.dart';

class ProfileController extends GetxController{

  // Logout Functionality
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all session data

    // Navigate to LoginScreen
    Get.offAll(() => LoginScreen());
  }

}