import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/images.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../../common/widgets/custom_chat_list_tile.dart';
import '../../../../common/widgets/custom_search_box.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import 'chatting_screen.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key});
  final searchController = TextEditingController();

  String profileImage = Images.serviceShortPhoto;
  String profileName = AppString.bird;
  String profileMsg = "I am a bird";
  String profileTime = "12 AM";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Column(
          children: [
            SizedBox(height: Dimensions.paddingSizeExtremeLarge,),
            Text(AppString.chat, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack),),
            SizedBox(height: Dimensions.paddingSizeSmall,),
            CustomSearchBox( hintText: AppString.searchForEvent, controller: searchController),
            SizedBox(height: Dimensions.paddingSizeSmall,),
            ListView.builder(
              itemCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){Get.to(ChattingScreen());},
                      child: CustomChatListTile(profileImage: profileImage,name: profileName,msg: profileMsg,time: profileTime,));
                },
            )

          ],
        ),
      ),

    );
  }
}
