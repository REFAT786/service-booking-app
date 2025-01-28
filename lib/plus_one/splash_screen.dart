import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../helper/prefs_helper.dart';
import '../utils/app_string.dart';
import '../utils/images.dart';
import '../utils/styles.dart';
import 'features/intro/screen/intro_screen.dart';
import 'features/nav_bar_screen/nav_bar_screen.dart';

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

  Future<void> _navigateToNextScreen() async {

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
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(Images.appIcon, height: 150, width: 150,)
        ),
      ],
    ));
  }
}
