import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_event_list_container.dart';
import '../../../../common/widgets/custom_my_upcoming_event.dart';
import '../../../../common/widgets/custom_recommended_companions_card.dart';
import '../../../../plus_one/views/calender_screen/screen/calender_screen.dart';
import '../../../../plus_one/views/event_screen/screen/event_detail_screen.dart';
import '../../../../plus_one/views/event_screen/screen/my_event_details_screen.dart';
import '../../../../plus_one/views/notification/screen/notification_screen.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/styles.dart';
import '../../seeker_companion_profile/seeker_companion_profile_screen.dart';

class SeekerHomeScreen extends StatelessWidget {
   SeekerHomeScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        onPressed: (){Get.to(NotificationScreen());},
                        icon: SvgPicture.asset(Images.notificationIcon)),
                  )
                ],
              ),
            ),
            SizedBox(height: Dimensions.paddingSizeSmall,),
            SizedBox(height: Dimensions.paddingSizeSmall,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeSmall),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Recommended Companions", style: styleBold.copyWith(color: AppColors.textBlack, fontSize: 20),)),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 350,
                    child: ListView.builder(
                      padding: EdgeInsets.all(1),
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: (){Get.to(SeekerCompanionProfileScreen());},
                              child: CustomRecommendedCompanionsCard()),
                        );
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
                  //SizedBox(height: Dimensions.paddingSizeExtraSmall,),
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
                      Text("My Upcoming Event", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Spacer(),
                      TextButton(
                          onPressed: (){Get.to(()); },
                          child: Text("See all", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
                      )
                    ],
                  ),
                  //SizedBox(height: 10,),
                  ListView.builder(
                    padding: EdgeInsets.all(1),
                    shrinkWrap: true,
                    itemCount: 5,
                    //scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          onTap: (){Get.to(MyEventDetailsScreen());},
                            child: CustomMyUpcomingEvent()),
                      );
                    },
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
