import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../utils/images.dart';
import '../../utils/app_color.dart';

class CustomOrganizedByView extends StatelessWidget {
   CustomOrganizedByView({super.key, required this.profileImage, required this.name,required this.designation});
  String name, designation, profileImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(profileImage),
        ),
        SizedBox(height: Dimensions.paddingSizeExtraSmall,),
        SizedBox(
          width: 50,
            child: Text(name, style: styleNormal.copyWith(fontSize: Dimensions.fontSizeFifteen, color: AppColors.textBlack, overflow: TextOverflow.ellipsis),maxLines: 2,)),
        SizedBox(height: Dimensions.paddingSizeExtraSmall,),
        SizedBox(
          width: 100,
            child: Text(designation, style: styleNormal.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.subTitleColor, overflow: TextOverflow.ellipsis),maxLines: 1,)),
      ],
    );
  }
}
