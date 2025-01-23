import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../helper/prefs_helper.dart';
import '../../../../repository/auth_repository.dart';
import '../../../nav_bar_screen/nav_bar_screen.dart';

class LoginController extends GetxController {

  //LoginController();

  final AuthRepository authRepository = AuthRepository();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isRemember = false;
  bool isLoading = false;
  static RxString role = "".obs;
  String token = "";

  // Toggles the "Remember Me" option
  void toggleRememberMe() {
    isRemember = !isRemember;
    update();
  }

  // Signs in the user
  Future<void> signInUser() async {

    isLoading = true;
    update();

    try {

      final response = await authRepository.loginUser(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      role.value = response['data']['user']['role'];
      token = response['data']['accessToken'];

      // Save session data if "Remember Me" is selected
      if (isRemember) {

        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('email', emailController.text);
        // await prefs.setString('token', token);
        // await prefs.setString('role', role.value); // Save the user's role
        // await prefs.setBool('isRemember', true);

        PrefsHelper.setString('email', emailController.text);
        PrefsHelper.setString('token', token);
        PrefsHelper.setString('role', role.value);
        PrefsHelper.setBool('isRemember', true);


      }

      //print("Login Info : \n email: ${emailController.text} \n role : ${role.value}" );
      print("Login Success: $response");
      Get.off(NavBarScreen()); // Navigate to home screen
    } catch (e, s) {
      print("Login Failed: $e");
      print("Login Failed: $s");
      Get.snackbar('Error', 'Login failed. Please check your credentials.');
    } finally {
      isLoading = false;
      update();
    }
  }

  // Auto-login if "Remember Me" was previously selected
  Future<void> checkSavedSession() async {
    final prefs = await SharedPreferences.getInstance();
    final isRemembered = prefs.getBool('isRemember') ?? false;

    if (isRemembered) {
      final role = prefs.getString('role') ?? '';
      final token = prefs.getString('token') ?? '';
      final email = prefs.getString('email') ?? '';

      // If session data exists, navigate to Profile Screen
      if (token.isNotEmpty && email.isNotEmpty && role.isNotEmpty) {
        Get.offAll(() => NavBarScreen());
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkSavedSession(); // Automatically load credentials when the controller is initialized
  }


}
