import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/common/widgets/custom_button.dart';
import 'package:service_booking_app/common/widgets/custom_text_field.dart';
import 'package:service_booking_app/utils/app_string.dart';
import '../../../../../../common/widgets/custom_app_bar.dart';
import '../../../../../../utils/dimensions.dart';
import '../../../../../../utils/images.dart';
import '../controller/forget_password_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, Dimensions.heightFifty),
            child: CustomAppBar(text: AppString.forgetPassword)),
        body: GetBuilder<ForgetPasswordController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                        height: Dimensions.introImageHeight,
                        width: Dimensions.introImageWidth,
                        child: Image.asset(Images.forgetPasswordImage)),
                    SizedBox(
                      height: Dimensions.paddingSizeSmall,
                    ),
                    CustomTextField(
                      prefixIcon: Icons.email,
                      hintText: "Email",
                      isSuffix: false,
                      controller: controller.emailController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            controller.checkEmailExistence();
                          }
                        },
                        child: CustomButton(
                          buttonText: "Next",
                          isLoading: controller.isLoading,
                        ))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
