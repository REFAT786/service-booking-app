import 'package:flutter/material.dart';
import 'package:service_booking_app/utils/dimensions.dart';

import 'custom_chat_list_tile.dart';

class CustomReviewScreenContainer extends StatelessWidget {
   CustomReviewScreenContainer({super.key, required this.reviewText, required this.profileImage, required this.profileName, required this.address});
  String reviewText ;
  String profileImage ;
  String profileName;
  String address;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(reviewText),
        SizedBox(height: Dimensions.paddingSizeSmall),
        Row(
          children: [
            Icon(Icons.star, color: Colors.orange,),
            Icon(Icons.star,color: Colors.orange),
            Icon(Icons.star, color: Colors.orange),
            Icon(Icons.star,color: Colors.orange),
          ],
        ),
        CustomChatListTile(profileImage: profileImage , name: profileName, msg: address, time: ""),
        Divider()

      ],
    );
  }
}
