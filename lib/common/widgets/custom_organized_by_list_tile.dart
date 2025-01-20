import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../utils/app_color.dart';

class CustomOrganizedByListTile extends StatelessWidget {
  CustomOrganizedByListTile({super.key, required this.icon, required this.title, required this.subTitle});
  IconData icon;
  String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            color: AppColors.secondary150
        ),
        child: Icon(icon, size: Dimensions.paddingSizeExtraLarge,color: AppColors.primary,),
      ),
      title: Text(title, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: AppColors.textBlack),),
      subtitle: Text(subTitle, style: styleNormal.copyWith(fontSize: Dimensions.fontSizeFifteen, color: AppColors.subTitleColor)),
    );
  }
}
