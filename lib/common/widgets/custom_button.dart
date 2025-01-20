import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.buttonText, this.isLoading});
  String? buttonText;
  bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.paddingSizeEighteen),
      width: double.infinity,
      decoration: BoxDecoration(
          color: buttonText==AppString.skip? AppColors.primary50:AppColors.primary,
          borderRadius: BorderRadius.circular(Dimensions.radiusFifty)
      ),
      child: Center(
          child:isLoading == true ? SizedBox(height: 22, width: 22,child: CircularProgressIndicator(color: AppColors.white,)): buttonText==AppString.skip?Text(
            "$buttonText",
            style: styleExtraBold.copyWith(color: AppColors.primary,fontSize: Dimensions.fontSizeSixteen, height: 1.40, letterSpacing: 0.20)
          ):Text(
            "$buttonText",
            style: styleExtraBold.copyWith(color: AppColors.white,fontSize: Dimensions.fontSizeSixteen, height: 1.40, letterSpacing: 0.20),
          )
      ),
    );
  }
}
