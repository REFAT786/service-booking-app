import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/app_color.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

class CustomDrawerListTile extends StatelessWidget {
   const CustomDrawerListTile({super.key, required this.leadingIcon,required this.title, required this.onTabFunction});
   final String title;
   final IconData leadingIcon;
   final VoidCallback onTabFunction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon, color: AppColors.primary,),
      title: Text(title, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColors.textBlack),),
      onTap: onTabFunction,
    );
  }
}
