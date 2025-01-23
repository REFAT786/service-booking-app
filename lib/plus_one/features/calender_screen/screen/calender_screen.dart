import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/common/widgets/custom_event_list_container.dart';
import 'package:service_booking_app/utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/styles.dart';
import '../../event_screen/screen/my_event_details_screen.dart';

class CalenderScreen extends StatelessWidget {
  CalenderScreen({super.key});
  final String image = Images.serviceCoverImage;
  final String eventName = AppString.art;
  final String date = AppString.friday;
  final String location = AppString.currentLocation;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text(
            AppString.yourCalender,
            style: styleExtraBold.copyWith(
                fontSize: Dimensions.fontSizeOverLarge,
                color: AppColors.textBlack),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  AppString.all,
                  style: styleBold.copyWith(
                      fontSize: Dimensions.fontSizeTwenty,
                      color: AppColors.textBlack),
                ),
              ),
              Tab(
                child: Text(
                  AppString.going,
                  style: styleBold.copyWith(
                      fontSize: Dimensions.fontSizeTwenty,
                      color: AppColors.textBlack),
                ),
              ),
              Tab(
                child: Text(
                  AppString.past,
                  style: styleBold.copyWith(
                      fontSize: Dimensions.fontSizeTwenty,
                      color: AppColors.textBlack),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.paddingSizeExtraSmall,
              left: Dimensions.paddingSizeSmall,
              right: Dimensions.paddingSizeSmall),
          child: TabBarView(
            children: <Widget>[
              SizedBox(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250,
                  ),
                  padding:
                      EdgeInsets.only(left: 1, right: 1, top: 5, bottom: 10),
                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          Dimensions.paddingSizeExtraSmall),
                      child: InkWell(
                        onTap: (){Get.to(MyEventDetailsScreen());},
                        child: CustomEventListContainer(
                          image: image,
                          eventName: eventName,
                          date: date,
                          location: location,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                  ),
                  padding:
                  EdgeInsets.only(left: 1, right: 1, top: 5, bottom: 10),
                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          Dimensions.paddingSizeExtraSmall),
                      child: InkWell(
                        onTap: (){Get.to(MyEventDetailsScreen());},
                        child: CustomEventListContainer(
                          image: image,
                          eventName: eventName,
                          date: date,
                          location: location,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                  ),
                  padding:
                  EdgeInsets.only(left: 1, right: 1, top: 5, bottom: 10),
                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          Dimensions.paddingSizeExtraSmall),
                      child: InkWell(
                        onTap: (){Get.to(MyEventDetailsScreen());},
                        child: CustomEventListContainer(
                          image: image,
                          eventName: eventName,
                          date: date,
                          location: location,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
