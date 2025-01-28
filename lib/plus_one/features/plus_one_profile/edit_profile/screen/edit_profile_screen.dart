import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:service_booking_app/common/widgets/custom_button.dart';
import 'package:service_booking_app/common/widgets/custom_interest_chip.dart';
import 'package:service_booking_app/plus_one/features/plus_one_profile/edit_profile/controller/edit_profile_controller.dart';
import 'package:service_booking_app/utils/styles.dart';
import '../../../../../common/widgets/custom_image_decoration.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/app_url.dart';
import '../../../../../utils/dimensions.dart';
import '../../../../../utils/images.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? _selectedGender;
  String? selectedCountry;
  final List<String> _genders = ['Male', 'Female', 'Other'];
  File? _image;
  final ImagePicker _picker = ImagePicker();
  TimeOfDay? selectedTime; // Holds the selected time


  final List<Map<String, dynamic>> interests = [
    {"name": "Movies", "isSelected": true},
    {"name": "Music", "isSelected": true},
    {"name": "Art", "isSelected": true},
    {"name": "Cooking", "isSelected": true},
    {"name": "Yoga", "isSelected": true},
    {"name": "Photography", "isSelected": true},
    {"name": "Gardening", "isSelected": true},
  ];

  void _showAddInterestDialog() {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Interest"),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: "Enter interest name"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String newInterest = _controller.text.trim();
                if (newInterest.isEmpty) {
                  // Show a warning if the input is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Interest name cannot be empty")),
                  );
                  return;
                }

                setState(() {
                  interests.insert(interests.length, {
                    "name": newInterest,
                    "icon": Icons.star, // You can allow users to choose an icon
                    "isSelected": true,
                  });
                });

                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

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
      appBar:  AppBar(
        leading: IconButton(
            onPressed: (){Get.back();},
            icon: Icon(Icons.arrow_back_ios)
        ),
        title: Text("Edit Profile", style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<EditProfileController>(builder: (controller) {
          return Column(
            children: [
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
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.secondary100,
                      borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                        border: InputBorder.none,
                        hintText: AppString.fullName,
                        hintStyle: styleNormal.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.secondary550),
                      ),
                    ),
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
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: styleNormal.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.secondary550),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  IntlPhoneField(
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
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    items: _genders.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        //controller.selectedGender = newValue;
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
                  const SizedBox(height: 10),
                  Text("My Interests", style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeTwenty, color: AppColors.textBlack)),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _showAddInterestDialog();
                    },
                    child: CustomInterestChip(
                      name: "+ Add",
                      isSelected: false,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    children: interests.map((interest) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              interest["isSelected"] = !interest["isSelected"];
                            });
                          },
                          child: CustomInterestChip(
                            name: interest["name"],
                            isSelected: interest["isSelected"],
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 10),
                  Text("Photos", style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeTwenty, color: AppColors.textBlack)),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .87
                      ),
                      itemCount: 7,
                      padding: EdgeInsets.all(1),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CustomImageDecoration(imageName: Images.serviceShortPhoto),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(buttonText: "Update Profile",),
                  const SizedBox(height: 10),


                ],
              )
            ],
          );
        },)
      ),
    );
  }
}
