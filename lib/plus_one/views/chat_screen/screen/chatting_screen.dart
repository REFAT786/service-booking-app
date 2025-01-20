import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';

class ChattingScreen extends StatelessWidget {
  ChattingScreen({super.key});
  String msg = "Chat message";
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: Dimensions.radiusLarge,
              backgroundImage: NetworkImage(Images.serviceShortPhoto),
            ),
            const SizedBox(width: Dimensions.paddingSizeSmall),
            Text(
              AppString.name,
              style: styleExtraBold.copyWith(
                  fontSize: Dimensions.fontSizeTwenty,
                  color: AppColors.textBlack),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              children: [
                // Replace with your chat messages
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: AppColors.primary100,
                              borderRadius: BorderRadius.circular(14)),
                          child: Text(
                            msg,
                            style: styleBold.copyWith(
                                fontSize: Dimensions.fontSizeExtraLarge,
                                color: AppColors.textBlack),
                          )),
                    )),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: AppColors.primary600,
                              borderRadius: BorderRadius.circular(14)),
                          child: Text(
                            msg,
                            style: styleBold.copyWith(
                                fontSize: Dimensions.fontSizeExtraLarge,
                                color: AppColors.white),
                          )),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: AppColors.primary100,
                              borderRadius: BorderRadius.circular(14)),
                          child: Text(
                            msg,
                            style: styleBold.copyWith(
                                fontSize: Dimensions.fontSizeExtraLarge,
                                color: AppColors.textBlack),
                          )),
                    )),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: AppColors.primary600,
                              borderRadius: BorderRadius.circular(14)),
                          child: Text(
                            msg,
                            style: styleBold.copyWith(
                                fontSize: Dimensions.fontSizeExtraLarge,
                                color: AppColors.white),
                          )),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.paddingSizeExtraSmall,
          ),
          Container(
            padding: const EdgeInsets.only(
                left: Dimensions.paddingSizeSmall,
                right: Dimensions.paddingSizeSmall,
                top: Dimensions.paddingSizeExtraSmall,
                bottom: Dimensions.paddingSizeTwenty),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.borderColor),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mic,
                    color: AppColors.primary,
                    size: Dimensions.paddingSizeExtraLarge,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.link,
                      color: AppColors.primary,
                      size: Dimensions.paddingSizeExtraLarge),
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: AppString.typeMsg,
                      filled: true,
                      fillColor: AppColors.white,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeFifteen,
                          vertical: Dimensions.paddingSizeSmall),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusOverLarge),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusOverLarge),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: Dimensions.paddingSizeSmall),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius:
                          BorderRadius.circular(Dimensions.paddingSizeFifteen)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
