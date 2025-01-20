import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/plus_one/views/auth/forget_password/controller/select_platform_for_otp_controller.dart';

import '../../../../../common/widgets/custom_app_bar.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_verify_msg_container.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/dimensions.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/styles.dart';

class SelectPlatformForOtpScreen extends StatefulWidget {

   SelectPlatformForOtpScreen({super.key});

  @override
  State<SelectPlatformForOtpScreen> createState() => _SelectPlatformForOtpScreenState();
}

class _SelectPlatformForOtpScreenState extends State<SelectPlatformForOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, Dimensions.heightFifty),
            child: CustomAppBar(text: "Make Selection")
        ),
        body: GetBuilder<SelectPlatformForOtpController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: Dimensions.introImageHeight,
                    width: Dimensions.introImageWidth,
                    child: Image.asset(Images.forgetPasswordImage)
                ),
                SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
                Container(
                  padding: EdgeInsets.all(Dimensions.paddingSizeTwenty),
                  child: Column(
                    children: [
                      Text(
                          AppString.forgetPasswordDetails,
                          style: styleDefault.copyWith(fontSize: Dimensions.fontSizeExtraLarge)
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeTwenty,
                      ),
                      GestureDetector(
                        onTap: () => controller.selectOption(AppString.sms),
                        child: CustomVerifyMsgContainer(
                          iconName: FontAwesomeIcons.message,
                          title: AppString.via_SMS,
                          subTitle: controller.phone!,
                          isSelected: controller.selectedOption == AppString.sms,
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeSmall),
                      GestureDetector(
                        onTap: () => controller.selectOption(AppString.email),
                        child: CustomVerifyMsgContainer(
                          iconName: Icons.email,
                          title: AppString.via_email,
                          subTitle: controller.email!,
                          isSelected: controller.selectedOption == AppString.email,
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeTwenty),
                      InkWell(
                          onTap: () => controller.proceedToOtp(),
                          child: CustomButton(buttonText: AppString.continueText,))
                    ],
                  ),
                ),

              ],
            ),
          );
        },)
    );
  }
}
