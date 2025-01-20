import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/app_color.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../../common/widgets/custom_event_list_container.dart';
import '../../../../common/widgets/custom_search_box.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/images.dart';

class FeatureEventScreen extends StatelessWidget {
   FeatureEventScreen({super.key});
  final searchController  = TextEditingController();
   final String image = Images.serviceCoverImage;
   final String eventName = AppString.art;
   final String date = AppString.friday;
   final String location = AppString.currentLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Get.back();},
            icon: Icon(Icons.arrow_back_ios)
        ),
        title: Text(AppString.featuredEvents, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Column(
          children: [
            CustomSearchBox(hintText: AppString.searchForEvent, controller: searchController),
            SizedBox(height: Dimensions.paddingSizeSmall,),
            GridView.builder(
              itemCount: 9,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: Dimensions.eventChildAspectRatio.h
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5, top: 0, bottom: 10),
                  child: CustomEventListContainer(
                    image: image,
                    eventName: eventName,
                    date: date,
                    location: location,
                  ),
                );
              },
            ),
            

          ],
        ),
      ),
    );
  }
}
