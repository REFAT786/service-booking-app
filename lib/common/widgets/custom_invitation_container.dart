import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../utils/app_color.dart';

class CustomInvitationContainer extends StatelessWidget {
  const CustomInvitationContainer({super.key, required this.image, required this.name, required this.location});
  final String name, location, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
      height: Dimensions.invitationHeight.h,
      width: Dimensions.invitationHeight.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.stoke),

      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image(image: NetworkImage(image), height: Dimensions.profileImageHeight, width: Dimensions.profileImageWidth,fit: BoxFit.cover,)
            ),
            SizedBox(height: Dimensions.paddingSizeExtraSmall,),
            SizedBox(
              width: Dimensions.textWidthSize,
                child: Text(name, style: styleBold.copyWith(color: AppColors.textBlack,fontSize: Dimensions.fontSizeSixteen, overflow: TextOverflow.ellipsis),maxLines: 1)),
            SizedBox(
                width: Dimensions.textWidthSize,
                child: Text(location, style: styleNormal.copyWith(color: AppColors.subTitleColor,overflow: TextOverflow.ellipsis),maxLines: 1))
          ],
        ),
      ),
    );
  }
}
