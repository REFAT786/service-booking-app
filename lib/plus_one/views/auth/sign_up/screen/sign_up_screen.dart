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
import '../../login/screen/login_screen.dart';
import '../controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<SignUpController>(
      builder: (controller) {
        return SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: Dimensions.paddingSizeExtremeLarge),
                const Text(AppString.logo, style: styleExtraBold),
                const SizedBox(height: Dimensions.paddingSizeSmall),
                Text(
                  AppString.create_Your_Account,
                  style: styleExtraBold.copyWith(
                    fontSize: 32,
                    height: 1.20,
                    color: AppColors.secondaryColor,
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeSmall),
                Column(
                  children: [
                    CustomTextField(
                      prefixIcon: Icons.email,
                      hintText: AppString.email,
                      isSuffix: false,
                      controller: controller.emailController,
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    CustomTextField(
                      prefixIcon: Icons.lock,
                      hintText: AppString.password,
                      isSuffix: true,
                      controller: controller.passwordController,
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    CustomTextField(
                      prefixIcon: Icons.lock,
                      hintText: AppString.confirm_Password,
                      isSuffix: true,
                      controller: controller.confirmPasswordController,
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() =>
                                Radio<String>(
                                  value: "seeker",
                                  groupValue: controller.selectedOption.value,
                                  onChanged: (value) {
                                    controller.updateSelectedOption(value!);
                                  },
                                  activeColor: AppColors.primary,
                                ),),
                                Text(
                                  "Seeker",
                                  style: styleBold.copyWith(
                                    fontSize: Dimensions.fontSizeSixteen,
                                    color: AppColors.textBlack,
                                  ),
                                ),

                        const SizedBox(width: Dimensions.paddingSizeTwenty),
                        Obx(() =>
                                Radio<String>(
                                  value: "plusone",
                                  groupValue: controller.selectedOption.value,
                                  onChanged: (value) {
                                    controller.updateSelectedOption(value!);
                                  },
                                  activeColor: AppColors.primary,
                                ),
                        ),
                                Text(
                                  "plus One",
                                  style: styleBold.copyWith(
                                    fontSize: Dimensions.fontSizeSixteen,
                                    color: AppColors.textBlack,
                                  ),
                                ),

                      ],
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    Obx(
                      () => controller.isLoading.value
                          ? CircularProgressIndicator()
                          : InkWell(
                              onTap: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  controller.registerUser();
                                }
                              },
                              child:
                                  CustomButton(buttonText: AppString.sign_UP),
                            ),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
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
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeSmall,
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
                              Get.to(LoginScreen());
                            },
                            child: Text(
                              AppString.signIn,
                              style: styleBold.copyWith(
                                  color: AppColors.primary,
                                  fontSize: Dimensions.fontSizeDefault),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
