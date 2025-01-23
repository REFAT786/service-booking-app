import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_booking_app/common/widgets/custom_button.dart';
import 'package:service_booking_app/utils/app_color.dart';

import '../../../../plus_one/features/nav_bar_screen/nav_bar_screen.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';

class GiveReviewScreen extends StatefulWidget {
   GiveReviewScreen({super.key});

  @override
  State<GiveReviewScreen> createState() => _GiveReviewScreenState();
}

class _GiveReviewScreenState extends State<GiveReviewScreen> {
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 80, bottom: 10),
        child: Column(
          children: [
            Text("Leave a Review for Isabella", style: styleBold.copyWith(fontSize: 24, color: AppColors.textBlack),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_border,
                  //color: Colors.deepOrangeAccent,
                  size: Dimensions.iconSizeTwentyFour,
                ),
                Icon(
                  Icons.star_border,
                  //color: Colors.deepOrangeAccent,
                  size: Dimensions.iconSizeTwentyFour,
                ),
                Icon(
                  Icons.star_border,
                  //color: Colors.deepOrangeAccent,
                  size: Dimensions.iconSizeTwentyFour,
                ),
                Icon(
                  Icons.star_border,
                  //color: Colors.deepOrangeAccent,
                  size: Dimensions.iconSizeTwentyFour,
                ),
                Icon(
                  Icons.star_border,
                  //color: Colors.deepOrangeAccent,
                  size: Dimensions.iconSizeTwentyFour,
                ),
                SizedBox(
                  width: Dimensions.paddingSizeExtraSmall,
                ),

              ],
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondary100,
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              ),
              child: TextField(
                //controller: controller.bioController,
                maxLines: 3, // Maximum number of lines
                maxLength: 100,
                decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                    hintText: "Write a review...",
                    hintStyle: styleNormal.copyWith(fontSize: Dimensions.fontSizeDefault, color: AppColors.secondary550),
                    border: InputBorder.none
                ),


              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: ()=>_pickImage(ImageSource.gallery),
              child: Container(
                width: 120,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primary)
                ),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt, color: AppColors.primary,),
                    SizedBox(width: 5,),
                    Text("Add Photo", style: styleDefault.copyWith(fontSize: 14),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){Get.to(Get.to(NavBarScreen()));},
                child: CustomButton(buttonText: "Submit Review",))

          ],
        ),
      ),

    );
  }
}
