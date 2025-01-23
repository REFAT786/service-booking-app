
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:service_booking_app/utils/app_string.dart';
import 'package:service_booking_app/utils/dimensions.dart';
import 'package:service_booking_app/utils/styles.dart';
import '../../../../../../common/widgets/custom_button.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/images.dart';
import '../controller/fill_profile_controller.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FillProfileController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.paddingSizeExtraLarge,
                ),
                Text(
                  AppString.profile,
                  style: styleBold.copyWith(
                      fontSize: Dimensions.fontSizeOverLarge,
                      color: AppColors.textBlack),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeExtraLarge,
                ),
                InkWell(
                  onTap: () => controller.pickImage(ImageSource.gallery),
                  child: CircleAvatar(
                    radius: Dimensions.radiusSixty,
                    backgroundImage: controller.image != null
                        ? FileImage(controller.image!)
                        : null,
                    child: controller.image == null
                        ? const Icon(Icons.add_a_photo, size: 30)
                        : null,
                  ),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeTwenty,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.secondary100,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault),
                  ),
                  child: TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.all(Dimensions.paddingSizeDefault),
                      border: InputBorder.none,
                      hintText: AppString.fullName,
                      hintStyle: styleNormal.copyWith(
                          fontSize: Dimensions.fontSizeDefault,
                          color: AppColors.secondary550),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.secondary100,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault),
                  ),
                  child: TextField(
                    controller: controller.bioController,
                    maxLines: Dimensions.textMaxLine, // Maximum number of lines
                    maxLength: Dimensions.textMaxLength,
                    decoration: InputDecoration(
                        counterText: "",
                        contentPadding:
                            EdgeInsets.all(Dimensions.paddingSizeDefault),
                        hintText: AppString.bio,
                        hintStyle: styleNormal.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            color: AppColors.secondary550),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
                IntlPhoneField(
                  controller: controller.phoneNumberController,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: AppString.phoneNumber,
                    hintStyle: styleNormal.copyWith(
                        fontSize: Dimensions.fontSizeDefault,
                        color: AppColors.secondary550),
                    fillColor: AppColors.secondary100,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                  ),
                  initialCountryCode: 'US',
                  onChanged: (phone) {
                    if (kDebugMode) {
                      print(phone.completeNumber);
                    }
                  },
                ),
                SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
                DropdownButtonFormField<String>(
                  value: controller.selectedGender,
                  items: controller.genders.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.updateGender(value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.secondary100,
                    hintText: AppString.selectGender,
                    hintStyle: styleNormal.copyWith(
                        fontSize: Dimensions.fontSizeDefault,
                        color: AppColors.secondary550),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: controller.openFilePicker, // Opens the file picker
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xffeff0f1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primary)
                    ),
                    child: controller.filePath == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.upload, color: AppColors.grey),
                              Text(
                                "Upload File",
                                style:styleBold.copyWith(color: AppColors.grey, fontSize: 16, ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.upload, color: Colors.grey),
                              Text(
                                "Already Uploded",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ],
                          ),
                  ),
                ),
                SizedBox(height: 20),
                if (controller.filePath != null)
                  Text(
                    "Uploaded File:\n${controller.filePath}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                SizedBox(height: Dimensions.paddingSizeTwenty),
                Spacer(),
                SizedBox(width: Dimensions.paddingSizeSmall),
                InkWell(
                  onTap: () {
                    controller.updateUserProfile();
                  },
                  child: CustomButton(
                    buttonText: AppString.continueText,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
