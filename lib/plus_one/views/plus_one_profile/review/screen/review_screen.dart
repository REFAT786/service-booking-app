import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../../../common/widgets/custom_review_screen_container.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/images.dart';

class ReviewScreen extends StatelessWidget {
   ReviewScreen({super.key});
  String reviewText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus.";
  String profileImage = Images.serviceShortPhoto;
  String profileName = AppString.name;
  String address = "Dhaka, BD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            AppString.review,
            style: styleExtraBold.copyWith(
                fontSize: Dimensions.fontSizeOverLarge,
                color: AppColors.textBlack),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
          itemCount: 7,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
              child: CustomReviewScreenContainer(profileImage: profileImage,address: address, profileName: profileName,reviewText: reviewText,),
            );
          },
        ));
  }
}
