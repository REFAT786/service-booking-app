import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/prefs_helper.dart';
import '../../../../repository/auth_repository.dart';
import '../../../nav_bar_screen/nav_bar_screen.dart';

class LoginController extends GetxController {

  final AuthRepository authRepository = AuthRepository();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isRemember = false;
  bool isLoading = false;
  String role = "";
  String token = "";
  static String image = "";
  static String fullName = "";
  static String email = "";
  String bio = "";
  String phone = "";
  String gender = "";
  List <String> interests = [];
  List <String> photos = [];


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


      email = response['data']['user']['email'];
      image = response['data']['user']['image'];
      fullName = response['data']['user']['fullName'];
      bio = response['data']['user']['about'];
      phone = response['data']['user']['phone'];
      gender = response['data']['user']['gender'];
      interests = List<String>.from(response['data']['user']['interests']);
      photos = List<String>.from(response['data']['user']['photos']);
      role = response['data']['user']['role'];
      token = response['data']['accessToken'];
      update();

      print("===============>>>>> $image");

      // Save session data if "Remember Me" is selected
      if (isRemember) {

        await PrefsHelper.setString('image', image);
        await PrefsHelper.setString('email', email);
        await PrefsHelper.setString('fullName', fullName);
        await PrefsHelper.setString('bio', bio);
        await PrefsHelper.setString('phone', phone);
        await PrefsHelper.setString('gender', gender);
        await PrefsHelper.setString('interests', interests.join(',')); // Save as a comma-separated string
        await PrefsHelper.setString('photos', photos.join(',')); // Save as a comma-separated string
        await PrefsHelper.setString('token', token);
        await PrefsHelper.setString('role', role);
        await PrefsHelper.setBool('isRemember', true);

      }
      print("Login Success: $response");
      Get.offAll(NavBarScreen()); // Navigate to home screen
    } catch (e) {
      print("Login Failed: $e");
      Get.snackbar('Error', 'Login failed. Please check your credentials.');
    } finally {
      isLoading = false;
      update();
    }
  }

  // Auto-login if "Remember Me" was previously selected
  Future<void> checkSavedSession() async {
    isRemember = await PrefsHelper.getBool('isRemember') ?? false;

    if (isRemember) {

      image = await PrefsHelper.getString('image');
      email = await PrefsHelper.getString('email');
      token = await PrefsHelper.getString('token');
      role = await PrefsHelper.getString('role');
      fullName = await PrefsHelper.getString('fullName');
      bio = await PrefsHelper.getString('bio');
      phone = await PrefsHelper.getString('phone');
      gender = await PrefsHelper.getString('gender');
      interests = (await PrefsHelper.getString('interests')).split(','); // Retrieve as a list
      photos = (await PrefsHelper.getString('photos')).split(','); // Retrieve as a list
      update();

      // If session data exists, navigate to Profile Screen
      if (token.isNotEmpty &&  role.isNotEmpty) {
        Get.offAll(() => NavBarScreen());
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkSavedSession();
  }


}
