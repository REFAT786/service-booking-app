import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../../common/widgets/custom_activity_container.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_event_list_container.dart';
import '../../../../common/widgets/custom_search_box.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/images.dart';
import 'create_event_screen.dart';
import 'event_detail_screen.dart';
import 'feature_event_screen.dart';
import 'my_event_details_screen.dart';
import 'my_event_screen.dart';

class EventScreen extends StatelessWidget {
   EventScreen({super.key});
  final searchController = TextEditingController();
   final String activity = AppString.outdoorActivities;
  //Feature
   final String featureImage = Images.serviceCoverImage;
   final String featureEventName = AppString.art;
   final String featureDate = AppString.friday;
   final String featureLocation = AppString.currentLocation;

   //My Event
   final String myEventImage = Images.serviceCoverImage;
   final String myEventName = AppString.art;
   final String myEventDate = AppString.friday;
   final String myEventLocation = AppString.currentLocation;

   //Upcoming Event
   final String upcomingEventImage = Images.serviceCoverImage;
   final String upcomingEventName = AppString.art;
   final String upcomingEventDate = AppString.friday;
   final String upcomingEventLocation = AppString.currentLocation;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeFifteen, vertical: Dimensions.paddingSizeExtraLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppString.event,
              style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack),
            ),
            const SizedBox(height: Dimensions.fontSizeTwenty),
            CustomSearchBox( hintText: AppString.searchForEvent, controller: searchController),
            const SizedBox(height: Dimensions.paddingSizeSmall),
            SizedBox(
              height: Dimensions.activitySizeBoxSize,
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                      child: CustomActivityContainer(name: activity),
                    );
                  },
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeSmall),
            Row(
              children: [
                Text(AppString.featuredEvents, style: styleBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: AppColors.textBlack),),
                Spacer(),
                TextButton(onPressed: (){Get.to(FeatureEventScreen()); },
                    child: Text(AppString.seeAll, style: styleBold.copyWith(fontSize: Dimensions.fontSizeDefault),)
                )
              ],
            ),
            //SizedBox(height: 5,),
            GridView.builder(
              itemCount: 4,
                shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisExtent: 250
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5, top: 0, bottom: 10),
                    child: InkWell(
                      onTap: (){
                        Get.to(EventDetailScreen());
                      },
                        child: CustomEventListContainer(
                          image: featureImage,
                          eventName: featureEventName,
                          date: featureDate,
                          location: featureLocation,
                        )),
                  );
                },
            ),
            const SizedBox(height: 0),

            Row(
              children: [
                Text(AppString.myEvent, style: styleBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: AppColors.textBlack),),
                Spacer(),
                TextButton(onPressed: (){Get.to(MyEventScreen());},
                    child: Text(AppString.seeAll, style: styleBold.copyWith(fontSize: Dimensions.fontSizeDefault),)
                )
              ],
            ),
            SizedBox(
              height: Dimensions.myEventSizeBoxSize,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 10),
                shrinkWrap: true,
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5, top: 0, bottom: 10),
                      child: InkWell(
                        onTap: (){Get.to(MyEventDetailsScreen());},
                        child: CustomEventListContainer(
                          image: myEventImage,
                          eventName: myEventName,
                          date: myEventDate,
                          location: myEventLocation,
                        ),
                      ),
                    );
                  },
              ),
            ),
             SizedBox(height: Dimensions.paddingSizeSmall),
            Align(
              alignment: Alignment.topLeft,
                child: Text(AppString.upcomingEvent, style: styleBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: AppColors.textBlack))),
            const SizedBox(height: Dimensions.paddingSizeSmall),
            GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5, top: 0, bottom: 10),
                  child: InkWell(
                    onTap: (){Get.to(MyEventDetailsScreen());},
                    child: CustomEventListContainer(
                      image: upcomingEventImage,
                      eventName: upcomingEventName,
                      date: upcomingEventDate,
                      location: upcomingEventLocation,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: Dimensions.paddingSizeSmall),
            InkWell(
              onTap: (){
                Get.to(CreateEventScreen());
              },
                child: CustomButton(buttonText: AppString.createNewEvent,))



          ],
        ),
      ),
    );
  }
}
