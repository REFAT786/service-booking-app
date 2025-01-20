import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/app_color.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../utils/images.dart';

class CustomChatListTile extends StatelessWidget {
   CustomChatListTile({super.key, required this.profileImage, required this.name, required this.msg, required this.time});
  String name, msg, time, profileImage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: Dimensions.radiusExtraLarge,
        backgroundImage: NetworkImage(profileImage),
      ),
      title: Row(
        children: [
          Text(name, style: styleBold.copyWith(fontSize: Dimensions.paddingSizeEighteen, color: AppColors.textBlack),),
          SizedBox(width: 4,),
          Icon(Icons.circle, color: AppColors.successNormal, size: Dimensions.radiusTwelve,)
        ],
      ),
      subtitle: Text(msg, style: styleNormal.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.subTitleColor),),
      trailing: Text(time, style: styleDefault.copyWith(fontSize:Dimensions.fontSizeDefault, color: AppColors.primary),),

    );
  }
}
