import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/app_string.dart';
import 'package:service_booking_app/utils/styles.dart';
import '../../plus_one/features/calender_screen/screen/calender_screen.dart';
import '../../plus_one/features/event_screen/screen/save_event_screen.dart';
import '../../plus_one/features/invitation_screen/screen/invitation_screen.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import 'custom_drawer_list_tile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}
class _CustomDrawerState extends State<CustomDrawer> {
  String name = AppString.name;
  String profileImage = Images.serviceShortPhoto;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            padding:  EdgeInsets.only(top: Dimensions.paddingSizeExtremeLarge,
                left: Dimensions.paddingSizeFifteen,right: Dimensions.paddingSizeFifteen, bottom: Dimensions.paddingSizeFifteen),
            //width: double.infinity,
            child: Column(
              children: [
                 CircleAvatar(
                  radius: Dimensions.radiusSixty,
                  backgroundImage: NetworkImage(profileImage)
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge,),
                Text(
                  name,
                  style: styleBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),
                )
              ],
            ),
          ),
          CustomDrawerListTile(leadingIcon: Icons.calendar_month , title: "Calender", onTabFunction: (){Get.to(CalenderScreen());}),
          CustomDrawerListTile(leadingIcon: Icons.bookmark , title: "Saved Events", onTabFunction: (){Get.to(SaveEventScreen());}),
          CustomDrawerListTile(leadingIcon: Icons.insert_invitation , title: "Invitation", onTabFunction: (){Get.to(InvitationScreen());}),
        ],
      ),
    );
  }
}
