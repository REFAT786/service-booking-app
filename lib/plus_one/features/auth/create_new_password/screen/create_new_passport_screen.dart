import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/styles.dart';
import '../../../../../../common/widgets/custom_app_bar.dart';
import '../../../../../../common/widgets/custom_text_field.dart';
import '../../../../../../utils/app_string.dart';
import '../../../../../../utils/dimensions.dart';
import '../../../../../../utils/images.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../controller/create_new_passport_controller.dart';

class CreateNewPassportScreen extends StatefulWidget {
  const CreateNewPassportScreen({super.key});

  @override
  State<CreateNewPassportScreen> createState() =>
      _CreateNewPassportScreenState();
}

class _CreateNewPassportScreenState extends State<CreateNewPassportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, Dimensions.heightFifty),
            child: CustomAppBar(text: AppString.createNewPassport)),
        body: GetBuilder<CreateNewPassportController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                  left: Dimensions.paddingSizeFifteen,
                  right: Dimensions.paddingSizeFifteen,
                  bottom: Dimensions.paddingSizeFifteen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.paddingSizeExtraLarge,
                  ),
                  Center(
                    child: SizedBox(
                        height: Dimensions.introImageHeight,
                        width: Dimensions.introImageWidth,
                        child: Image.asset(Images.newPasswordPageImage)),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Text(
                    AppString.createNewPassport,
                    style: styleDefault.copyWith(
                        fontSize: Dimensions.fontSizeExtraLarge,
                        height: 1.40,
                        letterSpacing: 0.20),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                  Column(
                    children: [
                      CustomTextField(
                          prefixIcon: Icons.lock,
                          hintText: AppString.newPassword,
                          isSuffix: true,
                          controller: controller.newPasswordController),
                      SizedBox(
                        height: Dimensions.paddingSizeSmall,
                      ),
                      CustomTextField(
                          prefixIcon: Icons.lock,
                          hintText: AppString.confirm_Password,
                          isSuffix: true,
                          controller: controller.confirmPasswordController),
                      SizedBox(
                        height: Dimensions.paddingSizeSmall,
                      ),

                      SizedBox(
                        height: Dimensions.paddingSizeSmall,
                      ),
                      InkWell(
                          onTap: controller.resetPassword,
                          child: CustomButton(
                            isLoading: controller.isLoading,
                            buttonText: AppString.continueText,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeSmall,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
