import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/common/widgets/custom_notification_content_card.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';
import '../../nav_bar_screen/nav_bar_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text("Notification", style: styleExtraBold.copyWith(
            fontSize: Dimensions.fontSizeOverLarge,
            color: AppColors.textBlack),),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == AppString.report) {
                Get.to(NavBarScreen());

              }
              else if (value == AppString.share) {
                // Perform logout operation
                //_showLogoutDialog(context);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: "Make as all read",
                child: Row(
                  children: [
                    //Icon(Icons.report, color: AppColors.textBlack, size: Dimensions.iconSizeSixteen,),
                    SizedBox(width: Dimensions.paddingSizeSmall), // Add space between icon and text
                    Text("Make as all read", style: styleExtraBold.copyWith(fontSize:  Dimensions.fontSizeDefault, color: AppColors.textBlack),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 6,
          padding: EdgeInsets.all(5),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: CustomNotificationContentCard(icon: Icons.calendar_month, title: "Your event 'Music concert' starts in 1 hour", subTitle: "Today at 9.40 PM"),
            );
          },
      ),
    );
  }
}
