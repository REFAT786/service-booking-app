import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/common/widgets/custom_image_decoration.dart';
import 'package:service_booking_app/utils/app_string.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../../common/widgets/Custom_organized_by_view.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_organized_by_list_tile.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/images.dart';


class EventDetailScreen extends StatelessWidget {
  EventDetailScreen({super.key});
  String date = "12 june";
  String publishDate = "January 12, 2024";
  String eventPublishImage = Images.serviceCoverImage;
  String eventCoverImage = Images.serviceCoverImage;
  String detail = "hhsskjsdscdiususndhiuscscscuhujsckjs ibvsk "
      "sbvsckbsicskbsdicbskc scbsifssfsdsfsdfs"
      "sdfsfsdfsfsfsdfsfsfsfsfsfsf"
      "sdfsfsdfsfsfsfsdfsfsfsfsfsdfsdfdsf"
      "sdfsfsdfsfsfsdfsfsfsfsddsfsdfsfsdfadADAFAD"
      "AsdDSDFSVCASJCBCCGVUADSVSBUDSCH SS"
      "CHSDFD kxchuidsvhsdfyuvcsiv";
  String profileName = AppString.name;
  String designation = "Designation hghisdghfisgf";
  String profileImage = Images.serviceShortPhoto;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Get.back();},
            icon: Icon(Icons.arrow_back_ios_new, size: Dimensions.iconSizeTwentyFour,)
        ),
        title: Text(AppString.evenDetail, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.bookmark, size: Dimensions.iconSizeTwentyFour, color: AppColors.textBlack,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 3,right: 3),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  child: CustomImageDecoration(imageName: eventCoverImage)),
              SizedBox(height: Dimensions.paddingSizeSmall,),
              Text(AppString.artExhibition, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack),),
              ListView.builder(
                itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){

                      },
                        child: CustomOrganizedByListTile(icon: Icons.calendar_month,title: "Date",subTitle: date,));
                  },
              ),
              SizedBox(height: Dimensions.paddingSizeExtraSmall,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppString.aboutTheEvent, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack)),
                  SizedBox(height: Dimensions.paddingSizeSmall,),
                  Text("${AppString.publishOn} $publishDate", style: styleBold.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.subTitleColor)),
                  SizedBox(height: Dimensions.paddingSizeSmall,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                      child: CustomImageDecoration(imageName: eventPublishImage)),
                  SizedBox(height: Dimensions.paddingSizeSmall,),
                  Text(detail)

                ],
              ),
              SizedBox(height: Dimensions.paddingSizeTwenty,),
              Column(
                children: [
                  Row(
                    children: [
                      Text(AppString.organizedBy,style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeTwenty, color: AppColors.textBlack),),
                      Spacer(),
                      Text(AppString.seeAll, style: styleBold.copyWith(fontSize: Dimensions.fontSizeDefault)),
                    ],
                  ),
                  SizedBox(height: Dimensions.paddingSizeSmall,),
                  SizedBox(
                    height: Dimensions.organizedBySizeBoxSize,
                    child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                          child: CustomOrganizedByView(profileImage: profileImage,name: profileName,designation: designation,),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: Dimensions.paddingSizeSmall,),
                  CustomButton(buttonText: AppString.joinEvent,),
                  SizedBox(height: Dimensions.paddingSizeSmall,),
                  Container(
                    padding: const EdgeInsets.all(18),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.greyButtonBgColor ,
                        borderRadius: BorderRadius.circular(Dimensions.radiusFifty),
                      border: Border.all(color: AppColors.borderColor, width: 2)
                    ),
                    child: Center(
                        child: Text(
                          AppString.addToCalender,
                          style: styleExtraBold.copyWith(color: AppColors.textBlack,fontSize: Dimensions.fontSizeSixteen, height: 1.40, letterSpacing: 0.20),
                        )),
                  )

                ],
              ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
