import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/app_color.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/images.dart';
import 'package:service_booking_app/utils/styles.dart';

class CustomReviewContainer extends StatelessWidget {
  const CustomReviewContainer({super.key, required this.reviewImage, required this.reviewProfileImage, required this.reviewProfileName, required this.reviewTime, required this.reviewTitle, required this.reviewSummary});
  final String reviewImage;
  final String reviewProfileImage;
  final String reviewProfileName;
  final String reviewTime;
  final String reviewTitle;
  final String reviewSummary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        color: AppColors.white,
        //borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary800,
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 128,
            width: 276,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            ),
            child: Image(image: NetworkImage(reviewImage),fit: BoxFit.cover,)
          ),
         
          SizedBox(height: Dimensions.paddingSizeSmall,),
          Row(
            children: [
              CircleAvatar(
                radius: Dimensions.radiusDefault,
                backgroundImage: NetworkImage(reviewProfileImage),
              ),
              SizedBox(width: Dimensions.paddingSizeExtraSmall,),
              SizedBox(
                width: 100,
                  child: Text(reviewProfileName,style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.subTitleColor, overflow: TextOverflow.ellipsis),maxLines: 1)),
              Text(" - " ),
              Text(reviewTime, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.subTitleColor, overflow: TextOverflow.ellipsis),maxLines: 1,),

            ],
          ),
          SizedBox(height: Dimensions.paddingSizeExtraSmall,),
          Text(
            reviewTitle,
            style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: AppColors.textBlack, overflow: TextOverflow.ellipsis),maxLines: 1,
          ),
          SizedBox(height: Dimensions.paddingSizeExtraSmall,),
          Text(
            reviewSummary,
            style: styleNormal.copyWith(fontSize: Dimensions.fontSizeSixteen,overflow:TextOverflow.ellipsis),maxLines: 3,
          ),

        ],
      ),
    );
  }
}
