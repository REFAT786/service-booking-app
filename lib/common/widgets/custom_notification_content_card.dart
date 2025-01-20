import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/app_color.dart';
import 'package:service_booking_app/utils/styles.dart';

class CustomNotificationContentCard extends StatelessWidget {
   CustomNotificationContentCard({super.key, required this.icon, required this.title, required this.subTitle});
  IconData icon;
  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: AppColors.white,
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary,),
        title: Text(title, style: styleBold.copyWith(fontSize: 18, color: AppColors.textBlack),),
        subtitle: Text(subTitle, style: styleNormal.copyWith(fontSize: 14),),
      ),
    );
  }
}
