import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/plus_one/views/intro/screen/intro_screen.dart';
import 'package:service_booking_app/plus_one/views/nav_bar_screen/nav_bar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/prefs_helper.dart';
import '../utils/app_string.dart';
import '../utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  // Navigate to the appropriate screen based on "Remember Me" state
  Future<void> _navigateToNextScreen() async {
    //final prefs = await SharedPreferences.getInstance();
    //final isRemembered = prefs.getBool('isRemember') ?? false;
    final isRemembered = await PrefsHelper.getBool('isRemember') ?? false;


    // Delay for splash screen display
    await Future.delayed(const Duration(seconds: 3));

    if (isRemembered) {
      // Navigate to NavBarScreen if "Remember Me" is true
      Get.offAll(() => const NavBarScreen());
    } else {
      // Navigate to IntroScreen otherwise
      Get.offAll(() => const IntroScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(AppString.logoText, style: styleExtraBold),
        ),
      ],
    ));
  }
}
