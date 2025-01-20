import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import '../../../../common/widgets/custom_invitation_container.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/images.dart';
import '../../../../utils/styles.dart';

class InvitationScreen extends StatelessWidget {
  InvitationScreen({super.key});
  final String image = Images.serviceShortPhoto;
  final String name = AppString.name;
  final String location = AppString.currentLocation;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading:  IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back() ,),
          centerTitle: true,
          title: Text(AppString.invitation, style: styleExtraBold.copyWith(
              fontSize: Dimensions.fontSizeOverLarge,
              color: AppColors.textBlack)),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(AppString.all,
                    style: styleBold.copyWith(
                        fontSize: Dimensions.fontSizeTwenty,
                        color: AppColors.textBlack),),
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
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
          child: TabBarView(
            children: <Widget>[
              SizedBox(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      mainAxisExtent: 260

                    ),
                    itemCount: 9,
                  padding: EdgeInsets.only(left: 1, right: 1, top: 5, bottom: 10),
                   // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                        child: CustomInvitationContainer(image: image,name: name,location: location),
                      );
                    },

              ),
                          ),
              SizedBox(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 260

                  ),
                  itemCount: 9,
                  padding: EdgeInsets.only(left: 1, right: 1, top: 5, bottom: 10),
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                      child: CustomInvitationContainer(image: image,name: name,location: location),
                    );
                  },

                ),
              ),
              SizedBox(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 260

                  ),
                  itemCount: 9,
                  padding: EdgeInsets.only(left: 1, right: 1, top: 5, bottom: 10),
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                      child: CustomInvitationContainer(image: image,name: name,location: location),
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
