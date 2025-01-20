import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:service_booking_app/utils/dimensions.dart';

import '../../../utils/app_color.dart';
import '../../../utils/styles.dart';

class CustomVerifyMsgContainer extends StatelessWidget {
  CustomVerifyMsgContainer({super.key, required this.iconName, required this.title, required this.subTitle, this.isSelected=false});
  IconData iconName;
  String title, subTitle;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSizeTwentyfour),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.borderColor,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              padding: EdgeInsets.all(Dimensions.paddingSizeFifteen),
              alignment: Alignment.center,
              color: AppColors.primary50,
              child: FaIcon(iconName, color: AppColors.primary,size: Dimensions.fontSizeOverLargeTwo,),
            ),
          ),
          SizedBox(width: Dimensions.paddingSizeSmall,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$title:", style: styleDefault.copyWith(fontSize: Dimensions.fontSizeDefault,color: AppColors.subTitleColor,),),
              Text(subTitle, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.textBlack),)
            ],
          )
        ],
      ),

    );
  }
}
