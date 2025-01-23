import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/app_string.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_image_decoration.dart';
import '../../../../common/widgets/custom_interest_field.dart';
import '../../../../common/widgets/custom_review_container.dart';
import '../../../../seekers/features/give_review/screen/give_review_screen.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../../../utils/styles.dart';
import '../../nav_bar_screen/nav_bar_screen.dart';

class PlusOneCompanionProfileScreen extends StatelessWidget {
  PlusOneCompanionProfileScreen({super.key});
  String image = Images.serviceShortPhoto;
  String name = AppString.name;
  String summary = AppString.summary;
  String rating = AppString.rating;
  String interestName = AppString.coffee;
  String reviewCoverImage = Images.serviceCoverImage;
  String reviewProfileImage = Images.serviceShortPhoto;
  String reviewProfileName = AppString.name;
  String reviewProfileTime = AppString.time;
  String reviewTitle = AppString.title;
  String reviewSummary = AppString.reviewSummary;
  IconData icon = Icons.coffee;

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
        title: Text(AppString.profile, style: styleExtraBold.copyWith(
            fontSize: Dimensions.fontSizeOverLarge,
            color: AppColors.textBlack),),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == AppString.report) {
                Get.to(NavBarScreen());

              } else if (value == AppString.report) {
                // Perform logout operation
                //_showLogoutDialog(context);
              } else if (value == AppString.block) {
                // Perform logout operation
                //_showLogoutDialog(context);
              }
              else if (value == AppString.share) {
                // Perform logout operation
                //_showLogoutDialog(context);
              }
            },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: AppString.report,
                  child: Row(
                    children: [
                      Icon(Icons.report, color: AppColors.textBlack, size: Dimensions.iconSizeSixteen,),
                      SizedBox(width: Dimensions.paddingSizeSmall), // Add space between icon and text
                      Text(AppString.report, style: styleExtraBold.copyWith(fontSize:  Dimensions.fontSizeDefault, color: AppColors.textBlack),),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: AppString.block,
                  child: Row(
                    children: [
                      Icon(Icons.block, color: AppColors.textBlack, size: Dimensions.iconSizeSixteen,),
                      SizedBox(width: Dimensions.paddingSizeSmall), // Add space between icon and text
                      Text(AppString.block, style: styleExtraBold.copyWith(fontSize:  Dimensions.fontSizeDefault, color: AppColors.textBlack),),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: AppString.share,
                  child: Row(
                    children: [
                      Icon(Icons.share, color: AppColors.textBlack, size: Dimensions.iconSizeSixteen,),
                      SizedBox(width: Dimensions.paddingSizeSmall), // Add space between icon and text
                      Text(AppString.share, style: styleExtraBold.copyWith(fontSize:  Dimensions.fontSizeDefault, color: AppColors.textBlack),),
                    ],
                  ),
                ),
              ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: Dimensions.paddingSizeSmall, right: Dimensions.paddingSizeSmall, bottom: Dimensions.paddingSizeExtraLarge, top: Dimensions.paddingSizeSmall),
        child: Column(
          children: [
            ClipOval(
              child: Image(image: NetworkImage(image), height: 120, width: 120,fit: BoxFit.cover,)
            ),
            SizedBox(
              height: Dimensions.paddingSizeTwenty,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    name,
                    style: styleBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack),
                  ),
                   SizedBox(
                    width: Dimensions.paddingSizeExtraSmall,
                  ),
                  Icon(
                    Icons.verified,
                    color: AppColors.primary,
                    size: Dimensions.iconSizeTwentyFour,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Text(
              summary,
              textAlign: TextAlign.center,
              style: styleDefault.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: AppColors.subTitleColor),
            ),
            SizedBox(
              height: Dimensions.paddingSizeExtraSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.deepOrangeAccent,
                  size: Dimensions.iconSizeTwentyFour,
                ),
                Icon(
                  Icons.star,
                  color: Colors.deepOrangeAccent,
                  size: Dimensions.iconSizeTwentyFour,
                ),
                Icon(
                  Icons.star,
                  color: Colors.deepOrangeAccent,
                  size: Dimensions.iconSizeTwentyFour,
                ),
                Icon(
                  Icons.star,
                  color: Colors.deepOrangeAccent,
                  size: Dimensions.iconSizeTwentyFour,
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.deepOrangeAccent,
                  size: Dimensions.iconSizeTwentyFour,
                ),
                SizedBox(
                  width: Dimensions.paddingSizeExtraSmall,
                ),
                Text(
                  rating,
                  style: styleDefault.copyWith(fontSize: Dimensions.fontSizeSixteen),
                )
              ],
            ),
            SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeExtraLarge, vertical: Dimensions.paddingSizeSmall),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [

                        InkWell(
                          child: Icon(
                            Icons.check_circle,
                            color: AppColors.successActive,
                            size: Dimensions.paddingSizeExtremeLarge,
                          ),
                          onTap: (){

                          },
                        ),
                        Text(
                          AppString.accept,
                          style: styleBold.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeExtraLarge, vertical: Dimensions.paddingSizeSmall),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.cancel,
                          color: AppColors.dangerNormal,
                          size: Dimensions.iconSizeForty,
                        ),
                        Text(
                          AppString.decline,
                          style: styleBold.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.dangerNormal),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Dimensions.paddingSizeExtraSmall,
            ),
            SizedBox(height: Dimensions.paddingSizeSmall,),

            SizedBox(
              height: Dimensions.interestSizeBoxSize.h,
              child: ListView.builder(
                padding: EdgeInsets.all(2),
                itemCount: 7,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                      child: CustomInterestField(name: interestName, icon: icon),
                    );
                  },
              ),
            ),
            SizedBox(height: Dimensions.paddingSizeSmall,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppString.review,
                style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack),
              ),
            ),
            SizedBox(height: Dimensions.paddingSizeExtraSmall,),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 7,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(2),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                      child: CustomReviewContainer(reviewImage: reviewCoverImage, reviewProfileImage: reviewProfileImage,reviewProfileName: reviewProfileName,reviewTime: reviewProfileTime,reviewTitle: reviewTitle,reviewSummary: reviewSummary,),
                    );
                  },
              ),
            ),
            SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppString.photos,
                style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack),
              ),
            ),
            SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            SizedBox(
              width: double.infinity,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    childAspectRatio: Dimensions.photoChildAspectRatio.h
                  ),
                  itemCount: 7,
                padding: EdgeInsets.all(1),
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                      child: CustomImageDecoration(imageName: Images.serviceShortPhoto),
                    );
                  },
              ),
            ),

            SizedBox(
              height: Dimensions.paddingSizeTwenty,
            ),
            InkWell(
              onTap: (){Get.to(GiveReviewScreen());},
                child: CustomButton(buttonText: AppString.giveReview)),

          ],
        ),
      ),
    );
  }
}
