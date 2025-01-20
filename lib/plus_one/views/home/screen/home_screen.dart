import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/app_string.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../../common/widgets/custom_current_week_container.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_event_list_container.dart';
import '../../../../common/widgets/custom_invitation_container.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/images.dart';
import '../../calender_screen/screen/calender_screen.dart';
import '../../event_screen/screen/event_detail_screen.dart';
import '../../invitation_screen/screen/invitation_screen.dart';
import '../../notification/screen/notification_screen.dart';
import '../../plus_one_profile/screen/plus_one_companion_profile_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  final String countryName = AppString.countryName;
  final String name = AppString.name;
  final String location = AppString.currentLocation;
  final String invitationImage = Images.serviceShortPhoto;

  final String image = Images.serviceCoverImage;
  final String eventName = AppString.art;
  final String date = AppString.friday;
  final String eventLocation = AppString.friday;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall,),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.paddingSizeTwenty),
              width: double.infinity,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (){
                        CustomDrawer();
                        _globalKey.currentState!.openDrawer();
                      },
                      icon: SvgPicture.asset(Images.menuIcon)
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(AppString.currentLocation, style: styleDefault.copyWith(fontSize: Dimensions.fontSizeDefault),),
                            InkWell(
                              onTap: (){},
                                child: Icon(Icons.keyboard_arrow_down, color: AppColors.primary,))
                          ],
                        ),
                        Text(countryName, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: AppColors.textBlack),)
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: Dimensions.paddingSizeSmall, left: Dimensions.paddingSizeSmall),
                    child: IconButton(
                        onPressed: () => Get.to(NotificationScreen()),
                        icon: SvgPicture.asset(Images.notificationIcon)),
                  )
                ],
              ),
            ),
            SizedBox(height: Dimensions.paddingSizeSmall,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeSmall),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(AppString.yourInvitation, style: styleBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: AppColors.textBlack),),
                      Spacer(),
                      TextButton(
                          onPressed: (){Get.to(InvitationScreen()); },
                          child: Text(AppString.seeAll, style: styleBold.copyWith(fontSize: Dimensions.fontSizeDefault),)
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      padding: EdgeInsets.all(2),
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                            child: InkWell(
                              onTap: (){
                                Get.to(PlusOneCompanionProfileScreen());
                              },
                                child: CustomInvitationContainer(image: invitationImage ,name: name, location: location,)));
                      },

                    ),
                  ),
                  SizedBox(height: Dimensions.paddingSizeSmall,),
                  Row(
                    children: [
                      Text(AppString.nearbyEvents, style: styleBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: AppColors.textBlack),),
                      Spacer(),
                      TextButton(
                          onPressed: (){Get.to(CalenderScreen()); },
                          child: Text(AppString.seeAll, style: styleBold.copyWith(fontSize: Dimensions.fontSizeDefault),)
                      )

                    ],
                  ),
                  SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      padding: EdgeInsets.all(2),
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                          child: InkWell(
                            onTap: (){
                              Get.to(EventDetailScreen());
                            },
                            child: CustomEventListContainer(
                              image: image,
                              eventName: eventName,
                              date: date,
                              location: eventLocation,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: Dimensions.paddingSizeSmall,),
                  Row(
                    children: [
                      Text(AppString.currentWeek, style: styleBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: AppColors.textBlack),),
                      Spacer(),
                      TextButton(
                          onPressed: (){Get.to(()); },
                          child: Text(AppString.seeAll, style: styleBold.copyWith(fontSize: Dimensions.fontSizeDefault),)
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      padding: EdgeInsets.all(2),
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                          child: CustomCurrentWeekContainer(),
                        );
                      },
                    ),
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
