import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_color.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Get.back();
        },
      ),
      centerTitle: true,
      title: Text(
        text,
        style: styleExtraBold.copyWith(
          color: AppColors.textBlack,
          fontSize: Dimensions.fontSizeOverLarge,
        ),
      ),
    );
  }
}
