import "package:flutter/material.dart";
import "package:flutter_otp_text_field/flutter_otp_text_field.dart";
import "package:get/get.dart";
import "package:service_booking_app/utils/app_string.dart";
import "../../../../../../common/widgets/custom_app_bar.dart";
import "../../../../../../common/widgets/custom_button.dart";
import "../../../../../../utils/app_color.dart";
import "../../../../../../utils/dimensions.dart";
import "../../../../../../utils/images.dart";
import "../../../../../../utils/styles.dart";
import "../controller/otp_controller.dart";
class OtpScreen extends StatefulWidget {


  OtpScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, Dimensions.heightFifty),
          child: CustomAppBar(text: AppString.enterOTP)
      ),
      body: GetBuilder<OtpController>(builder: (controller) {
        return SingleChildScrollView(
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.introImageHeight,
                  width: Dimensions.introImageWidth,
                  child: Image.asset(Images.otpImage),
                ),
                SizedBox(height: Dimensions.paddingSizeSmall),
                Container(
                  padding: EdgeInsets.all(Dimensions.paddingSizeTwenty),
                  child: Column(
                    children: [
                      Text(
                        "Enter the 6-digit OTP",
                        textAlign: TextAlign.center,
                        style: styleDefault.copyWith(
                          fontSize: Dimensions.paddingSizeEighteen,
                          color: AppColors.textBlack, overflow: TextOverflow.ellipsis
                        ), maxLines: 1,
                      ),
                      const SizedBox(height: Dimensions.paddingSizeDefault),

                      // OTP Input Field
                      OtpTextField(
                        numberOfFields: 6,
                        fieldWidth: 50,
                        borderColor: AppColors.grey,
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {
                          // Handle logic when the user changes a single digit.
                        },
                        onSubmit: (String otp) {
                          // Assign the OTP to the controller
                          controller.otpCode = otp;
                        },
                      ),


                      const SizedBox(height: Dimensions.paddingSizeFifteen),
                      if (controller.showResendButton)
                        TextButton(
                          onPressed: controller.resendOtp,
                          child: Text('Resend OTP'),
                        )
                      else
                        Text(
                          "Resend OTP in ${controller.remainingTime}s",
                          style: TextStyle(color: Colors.grey),
                        ),
                       SizedBox(height: Dimensions.paddingSizeExtremeLarge),

                      InkWell(
                          onTap: () {
                            if (widget.formKey.currentState?.validate() ?? false) {
                              controller.verifyOtp();
                            }
                          },
                          child: CustomButton(
                            isLoading: controller.isLoading,
                            buttonText: AppString.verify,
                          )),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
