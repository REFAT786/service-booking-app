import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:service_booking_app/utils/dimensions.dart';

import '../../../utils/app_color.dart';

class CustomIconContainer extends StatelessWidget {
  CustomIconContainer({super.key, required this.iconName});
  String iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeFifteen, horizontal: Dimensions.paddingSizeTwenty),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Dimensions.radiusSixteen),
      ),
      child: SvgPicture.asset(iconName, height: Dimensions.iconSizeTwentyFour, width: Dimensions.iconSizeTwentyFour,)
    );
  }
}
