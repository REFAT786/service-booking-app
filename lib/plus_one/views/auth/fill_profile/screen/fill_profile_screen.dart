import 'dart:io';
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
import '../../../nav_bar_screen/nav_bar_screen.dart';
import '../controller/fill_profile_controller.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
   // Holds the selected gender
  final List<String> _genders = ['Male', 'Female', 'Other']; // Dropdown options

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FillProfileController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.paddingSizeExtraLarge,
              ),
              Text(
                AppString.profile,
                style: styleBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack),
              ),
              SizedBox(
                height: Dimensions.paddingSizeExtraLarge,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: Dimensions.radiusSixty,
                    backgroundImage: NetworkImage(Images.serviceShortPhoto),
                  ),
                  Positioned(
                      bottom: 3,
                      right: 3,
                      child: Container(
                        height: Dimensions.paddingSizeExtraLarge,
                        width: Dimensions.paddingSizeExtraLarge,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                        ),
                        child: IconButton(
                          onPressed: () => _pickImage(ImageSource.gallery),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: Dimensions.iconSizeSixteen,
                            ),)
                      )),
                ],
              ),
              SizedBox(
                height: Dimensions.paddingSizeTwenty,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.secondary100,
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                ),
                child: TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                    border: InputBorder.none,
                    hintText: AppString.fullName,
                    hintStyle: styleNormal.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.secondary550),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.paddingSizeSmall,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.secondary100,
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                ),
                child: TextField(
                  controller: controller.bioController,
                  maxLines: Dimensions.textMaxLine, // Maximum number of lines
                  maxLength: Dimensions.textMaxLength,
                  decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                      hintText: AppString.bio,
                      hintStyle: styleNormal.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.secondary550),
                      border: InputBorder.none
                  ),


                ),
              ),
              SizedBox(height: Dimensions.paddingSizeSmall,),

              IntlPhoneField(
                controller: controller.phoneNumberController,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: AppString.phoneNumber,
                  hintStyle: styleNormal.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.secondary550),
                  fillColor: AppColors.secondary100,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  ),
                ),
                initialCountryCode: 'US',
                onChanged: (phone) {
                  if (kDebugMode) {
                    print(phone.completeNumber);
                  }
                },
              ),

              SizedBox(height: Dimensions.paddingSizeSmall,),

              DropdownButtonFormField<String>(
                value: controller.selectedGender,
                items: _genders.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    controller.selectedGender = newValue;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.secondary100,
                  hintText: AppString.selectGender,
                  hintStyle: styleNormal.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.secondary550),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.paddingSizeTwenty),
              Spacer(),

              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Get.to(NavBarScreen());
                      },
                      child: CustomButton(
                        buttonText: AppString.skip,
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.paddingSizeSmall),
                  Expanded(
                    child: InkWell(
                      onTap: (){Get.to(NavBarScreen());},
                      child: CustomButton(
                        buttonText: AppString.continueText,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        );
      },),
    );
  }
}
