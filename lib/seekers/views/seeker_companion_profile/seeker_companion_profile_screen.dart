import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_image_decoration.dart';
import '../../../common/widgets/custom_interest_field.dart';
import '../../../common/widgets/custom_mutual_connection_card.dart';
import '../../../common/widgets/custom_review_container.dart';
import '../../../plus_one/views/nav_bar_screen/nav_bar_screen.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../give_review/screen/give_review_screen.dart';

class SeekerCompanionProfileScreen extends StatelessWidget {
   SeekerCompanionProfileScreen({super.key});

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

            CustomButton(buttonText: "Invite",),
            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(18),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.primary)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message, color: AppColors.primary,),
                  SizedBox(width: 5,),
                  Text(
                    "Message",
                    style:
                    TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeSixteen),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: Dimensions.paddingSizeExtraSmall,
            ),


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
              height: Dimensions.reviewSizeBoxSize,
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
                'Mutual Connection',
                style: TextStyle(
                  color: Color(0xFF0C0C0C),
                  fontSize: 24,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 175,
              child: ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                padding: EdgeInsets.all(1),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomMutualConnectionCard(),
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
