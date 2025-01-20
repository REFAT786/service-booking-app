import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/custom_button.dart';
import '../../../../../../common/widgets/custom_icon_container.dart';
import '../../../../../../common/widgets/custom_text_field.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/app_string.dart';
import '../../../../../../utils/dimensions.dart';
import '../../../../../../utils/images.dart';
import '../../../../../../utils/styles.dart';
import '../../forget_password/screen/forget_password_screen.dart';
import '../../sign_up/screen/sign_up_screen.dart';
import '../controller/loginController.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: Dimensions.paddingSizeExtraLarge,
                  ),
                  const Text(AppString.logo, style: styleExtraBold),
                  const SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Text(AppString.login_Your_Account,
                      style: styleExtraBold.copyWith(
                          fontSize: 32,
                          height: 1.20,
                          color: AppColors.secondaryColor)),
                  const SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Container(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: Column(
                      children: [
                        CustomTextField(
                            prefixIcon: Icons.email,
                            hintText: AppString.email,
                            isSuffix: false,
                            controller: controller.emailController),
                        const SizedBox(
                          height: Dimensions.paddingSizeSmall,
                        ),
                        CustomTextField(
                            prefixIcon: Icons.lock,
                            hintText: AppString.password,
                            isSuffix: true,
                            controller: controller.passwordController),
                        const SizedBox(
                          height: Dimensions.paddingSizeSmall,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: controller.isRemember,
                              activeColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusSmall),
                              ),
                              onChanged: (value) =>
                                  controller.toggleRememberMe(),
                            ),
                            Text(
                              AppString.rememberMe,
                              style: styleBold.copyWith(
                                  color: AppColors.secondaryColor,
                                  fontSize: Dimensions.fontSizeDefault),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: Dimensions.paddingSizeSmall,
                        ),
                        InkWell(
                            onTap: () {
                              if (formKey.currentState?.validate() ?? false) {
                                controller.signInUser();
                              }
                            },
                            child: CustomButton(
                              isLoading: controller.isLoading,
                              buttonText: AppString.signIn,
                            )),

                        const SizedBox(
                          height: Dimensions.paddingSizeTwenty,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(ForgetPasswordScreen());
                            },
                            child: Text(
                              "${AppString.forgetPassword}?",
                              style: styleBold.copyWith(
                                  color: AppColors.primary,
                                  fontSize: Dimensions.fontSizeSixteen,
                                  height: 1.40),
                            )),
                        const SizedBox(
                          height: Dimensions.paddingSizeExtraLarge,
                        ),
                        Text(
                          AppString.or_continue_with,
                          style: styleBold.copyWith(
                              fontSize: Dimensions.fontSizeExtraLarge,
                              color: AppColors.subTitleColor,
                              height: 1.40),
                        ),
                        const SizedBox(
                          height: Dimensions.paddingSizeExtraLarge,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconContainer(
                              iconName: Images.facebookIcon,
                            ),
                            const SizedBox(
                              width: Dimensions.paddingSizeSmall,
                            ),
                            CustomIconContainer(
                              iconName: Images.googleIcon,
                            ),
                            const SizedBox(
                              width: Dimensions.paddingSizeSmall,
                            ),

                          ],
                        ),
                        const SizedBox(
                          height: Dimensions.paddingSizeTwenty,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppString.dont_have_an_account,
                              style: styleNormal.copyWith(
                                  color: AppColors.subTitleColor,
                                  fontSize: Dimensions.fontSizeDefault),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(SignUpScreen());
                                },
                                child: Text(
                                  AppString.sign_UP,
                                  style: styleBold.copyWith(
                                      color: AppColors.primary,
                                      fontSize: Dimensions.fontSizeDefault),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

