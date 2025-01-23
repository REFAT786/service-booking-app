import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/app_string.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_register_with_social_media_container.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/images.dart';
import '../../auth/login/screen/login_screen.dart';
import '../../auth/sign_up/screen/sign_up_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
          child: Column(
            children: [
              const SizedBox(
                height: Dimensions.paddingSizeExtremeLarge,
              ),
              SizedBox(
                  height: Dimensions.introImageHeight,
                  width: Dimensions.introImageWidth,
                  child: Image.asset(Images.introImage)
              ),
              const SizedBox(
                height: Dimensions.paddingSizeSmall,
              ),
              Text(
                AppString.introText,
                style: styleExtraBold.copyWith(color: AppColors.secondaryColor, fontSize: 70.h),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Dimensions.paddingSizeSmall,
              ),
              Column(
                children: [
                  CustomRegisterWithSocialMediaContainer(
                    iconName: Images.facebookIcon,
                    text: AppString.continue_with_Facebook,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  CustomRegisterWithSocialMediaContainer(
                    iconName: Images.googleIcon,
                    text: AppString.continue_with_Google,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),

                  Text(
                    AppString.or,
                    style: styleBold.copyWith(
                        fontSize: Dimensions.fontSizeExtraLarge,
                        height: 1.40,
                        letterSpacing: 0.20,
                        color: AppColors.introOrColor),
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeExtraLarge,
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: CustomButton(
                        buttonText: AppString.sign_In_With_Password,
                      )),
                  const SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.dont_have_an_account,
                        style: styleBold.copyWith(
                          color: AppColors.subTitleColor,
                          fontSize: Dimensions.fontSizeDefault,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(SignUpScreen());
                          },
                          child: Text(
                            AppString.sign_UP,
                            style: styleBold.copyWith(
                                fontSize: Dimensions.fontSizeExtraLarge,
                                height: 1.40,
                                letterSpacing: 0.20,
                                color: AppColors.primary),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
