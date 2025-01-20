import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../utils/app_color.dart';

class CustomRegisterWithSocialMediaContainer extends StatelessWidget {
  CustomRegisterWithSocialMediaContainer({super.key, required this.iconName, required this.text});
  String iconName;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.paddingSizeEighteen),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Dimensions.radiusTwelve),
        border: Border.all(color: AppColors.borderColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconName, width: Dimensions.iconSizeTwentyFour, height: Dimensions.iconSizeTwentyFour,),
          SizedBox(width: Dimensions.paddingSizeSmall,),
          Text(text, style: styleBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.secondaryColor),),
        ],
      ),

    );
  }
}
