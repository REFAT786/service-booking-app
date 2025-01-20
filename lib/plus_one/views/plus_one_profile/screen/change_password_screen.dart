import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/common/widgets/custom_button.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';
import '../../auth/login/screen/login_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Get.back();},
            icon: Icon(Icons.arrow_back_ios)
        ),
        title: Text("Change Password", style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Change Password", style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeTwenty, color: AppColors.textBlack)),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                fillColor: AppColors.secondary100,
                filled: true,
                hintText: "Enter Current Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                fillColor: AppColors.secondary100,
                filled: true,
                hintText: "Enter New Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                fillColor: AppColors.secondary100,
                filled: true,
                hintText: "Confirm New Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: ()=>Get.to(LoginScreen()),
                child: CustomButton(buttonText: "Change Password",))
          ],
        ),
      ),
    );
  }
}
