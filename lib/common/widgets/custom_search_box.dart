import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../utils/app_color.dart';


class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox(
      {super.key,
      required this.hintText,
      required this.controller});

      final String hintText;
      final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondary100,
        borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(Dimensions.paddingSizeFifteen),
          prefixIcon: Icon(Icons.search, color: AppColors.secondary550, size: Dimensions.iconSizeTwenty,),
          suffixIcon: Icon(Icons.mic, color: AppColors.secondary550, size: Dimensions.iconSizeTwenty,),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: styleNormal.copyWith(fontSize: Dimensions.paddingSizeDefault, color: AppColors.secondary550),
        ),
      ),
    );
  }
}
