import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_booking_app/plus_one/views/plus_one_profile/profile/controller/profile_controller.dart';
import 'package:service_booking_app/plus_one/views/plus_one_profile/screen/privacy_policy_screen.dart';
import 'package:service_booking_app/plus_one/views/plus_one_profile/review/screen/review_screen.dart';
import 'package:service_booking_app/plus_one/views/plus_one_profile/screen/security_screen.dart';
import 'package:service_booking_app/utils/images.dart';
import 'package:service_booking_app/utils/styles.dart';

import '../../../../../common/widgets/custom_profile_list_tile.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/dimensions.dart';
import '../../screen/change_password_screen.dart';
import '../../screen/edit_profile_screen.dart';
import '../../screen/help_center_screen.dart';
import '../../screen/language_screen.dart';
import '../../screen/notification_setting_screen.dart';


class ProfileScreen extends StatefulWidget {
   ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String profileImage = Images.serviceShortPhoto;

  String profileName = AppString.name;

  String mail = AppString.mail;

  String point = AppString.points;

  String title = "Edit Profile";

  IconData icon = Icons.account_circle;

  String rightTitle = "";

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
      body: GetBuilder<ProfileController>(builder: (controller) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeTwenty, vertical: Dimensions.paddingSizeExtremeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  AppString.profile,
                  style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack)
              ),
              const SizedBox(height: Dimensions.paddingSizeTwenty),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: Dimensions.radiusSixty,
                    backgroundImage: NetworkImage(profileImage),
                  ),
                  GestureDetector(
                    onTap: (){Get.to(_pickImage(ImageSource.gallery));},
                    child: Container(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: Dimensions.iconSizeSixteen,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.paddingSizeExtraLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(profileName, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeTwenty, color: AppColors.textBlack),),
                  SizedBox(width: Dimensions.paddingSizeExtraSmall,),
                  Icon(Icons.verified, color: Colors.lightBlue,)
                ],
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              Text(mail),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.primary)
                  ),
                  onPressed: (){},
                  child: Text(point, style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: AppColors.white),)),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              Container(
                padding: EdgeInsets.all(Dimensions.paddingSizeEighteen),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radiusOverLarge),
                    color: AppColors.primary
                ),
                child: ListTile(
                  leading: Icon(Icons.workspace_premium, color: Colors.deepOrangeAccent,size: Dimensions.iconSizeForty,),
                  title: Text(AppString.joinPremium, style: styleExtraBold.copyWith(fontSize: 20, color: AppColors.white),),
                  trailing: Icon(Icons.arrow_forward_ios, color: AppColors.white,size: Dimensions.iconSizeSixteen,),
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              InkWell(
                  onTap: (){Get.to(EditProfileScreen());},
                  child: CustomProfileListTile(title: "Edit Profile", icon: Icons.person_outline,rightTitle: rightTitle,)
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              InkWell(
                  onTap: (){Get.to(NotificationSettingScreen());},
                  child: CustomProfileListTile(title: "Notification", icon: Icons.notifications,rightTitle: rightTitle,)
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              InkWell(
                  onTap: (){Get.to(ChangePasswordScreen());},
                  child: CustomProfileListTile(title: "Change Password", icon: Icons.lock,rightTitle: rightTitle,)
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              InkWell(
                  onTap: (){Get.to(SecurityScreen());},
                  child: CustomProfileListTile(title: "Security", icon: Icons.security,rightTitle: rightTitle,)
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              InkWell(
                  onTap: (){Get.to(LanguageScreen());},
                  child: CustomProfileListTile(title: "Language", icon: Icons.language,rightTitle: "English US",)
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              InkWell(
                  onTap: (){Get.to(HelpCenterScreen());},
                  child: CustomProfileListTile(title: "Help Center", icon: Icons.help,rightTitle: rightTitle,)
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              InkWell(
                  onTap: (){Get.to(PrivacyPolicyScreen());},
                  child: CustomProfileListTile(title: "Privacy Policy", icon: Icons.policy,rightTitle: rightTitle,)
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              InkWell(
                  onTap: (){Get.to(ReviewScreen());},
                  child: CustomProfileListTile(title: "My Review", icon: Icons.reviews,rightTitle: rightTitle,)
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              InkWell(
                onTap: (){
                  controller.logout(); // Call the logout function
                },
                child: ListTile(
                  leading: Icon(Icons.logout, color: AppColors.red,),
                  title: Text(AppString.logout, style: styleBold.copyWith(fontSize: Dimensions.fontSizeTwenty, color: AppColors.red),),

                ),
              )


              // Additional fields can go here.
            ],
          ),
        );
      },)
    );
  }
}
