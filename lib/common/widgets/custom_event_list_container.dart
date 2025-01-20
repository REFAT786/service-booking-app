import 'package:flutter/material.dart';
import '../../../utils/app_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/styles.dart';

class CustomEventListContainer extends StatelessWidget {
  const CustomEventListContainer({super.key, required this.image, required this.eventName, required this.date, required this.location});
  final String image;
  final String eventName;
  final String date;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
      //width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.stoke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.radiusTwelve),
          child: Image(image: NetworkImage(image), height: Dimensions.coverImageHeight, width: Dimensions.coverImageWidth,fit: BoxFit.cover,)
          ),
          SizedBox(height: Dimensions.paddingSizeSmall,),
          SizedBox(
              width: Dimensions.textWidthSize,
              child: Text(eventName, style: styleBold.copyWith(color: AppColors.textBlack,fontSize: Dimensions.fontSizeDefault, overflow: TextOverflow.ellipsis),maxLines: 1)
          ),
          SizedBox(height: Dimensions.paddingSizeExtraSmall,),
          SizedBox(
              width: Dimensions.textWidthSize,
              child: Text(date, style: styleBold.copyWith(color: AppColors.primary,fontSize: Dimensions.fontSizeDefault, overflow: TextOverflow.ellipsis),maxLines: 1)
          ),
          SizedBox(height: Dimensions.paddingSizeExtraSmall,),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: AppColors.primary,size: Dimensions.iconSizeSixteen,),
              Text(location, style: styleDefault.copyWith(color: AppColors.subTitleColor,fontSize: Dimensions.fontSizeDefault, overflow: TextOverflow.ellipsis),maxLines: 1,)
            ],
          )
        ],
      ),

    );
  }
}
