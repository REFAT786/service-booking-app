import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../utils/app_color.dart';

class CustomProfileListTile extends StatelessWidget {
  CustomProfileListTile({super.key, required this.title, required this.rightTitle, required this.icon});
  String title;
  String rightTitle;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.subTitleColor,),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: styleBold.copyWith(fontSize: Dimensions.fontSizeTwenty, color: AppColors.textBlack),),
          Text(rightTitle, style: styleBold.copyWith(fontSize: 16, color: AppColors.introOrColor)),
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
