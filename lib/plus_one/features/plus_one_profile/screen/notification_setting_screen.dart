import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';

class NotificationSettingScreen extends StatefulWidget {
  @override
  _NotificationSettingScreenState createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  final Map<String, bool> notifications = {
    "General Notification": true,
    "New Services Available": false,
    "App Updates": true,
    "Subscription": false,
    "Customer Feedback": true,
    "Product Enhancements": false,
    "Feature Requests": true,
    "Bug Fixes": false,
    "Promotional Offers": true,
    "User Interface Improvements": false,
    "Security Updates": true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Get.back();},
            icon: Icon(Icons.arrow_back_ios)
        ),
        title: Text("Notification", style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: ListView.separated(
          itemCount: notifications.length,
          separatorBuilder: (context, index) => Divider(height: 1),
          itemBuilder: (context, index) {
            String title = notifications.keys.elementAt(index);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Switch(
                  activeColor: AppColors.primary,
                  value: notifications[title]!,
                  onChanged: (value) {
                    setState(() {
                      notifications[title] = value;
                    });
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}