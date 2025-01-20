import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/utils/app_string.dart';

import '../../../../../../common/widgets/custom_button.dart';
import '../../../../../../common/widgets/custom_interest_chip.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/dimensions.dart';
import '../../../../../../utils/styles.dart';
import '../../fill_profile/screen/fill_profile_screen.dart';

class ChooseInterestScreen extends StatefulWidget {
  const ChooseInterestScreen({super.key});

  @override
  State<ChooseInterestScreen> createState() => _ChooseInterestScreenState();
}

class _ChooseInterestScreenState extends State<ChooseInterestScreen> {
  // Sample list of interests with initial selection state
  final List<Map<String, dynamic>> interests = [
    {"name": "Hiking", "isSelected": true},
    {"name": "Dialog", "isSelected": false},
    {"name": "Coffee", "isSelected": false},
    {"name": "Reading", "isSelected": true},
    {"name": "Travel", "isSelected": false},
    {"name": "Movies", "isSelected": false},
    {"name": "Music", "isSelected": false},
    {"name": "Art", "isSelected": false},
    {"name": "Cooking", "isSelected": true},
    {"name": "Yoga", "isSelected": false},
    {"name": "Photography", "isSelected": false},
    {"name": "Gardening", "isSelected": false},
    {"name": "Running", "isSelected": false},
    {"name": "Swimming", "isSelected": false},
    {"name": "Cycling", "isSelected": false},
    {"name": "Rock climbing", "isSelected": false},
    {"name": "Sushi tasting", "isSelected": false},
    {"name": "Wildlife photography", "isSelected": true},
    {"name": "Meditation", "isSelected": true},
    {"name": "Street photography", "isSelected": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: Dimensions.paddingSizeExtraLarge),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                AppString.chooseYourInterest,
                style: styleExtraBold.copyWith(
                  color: AppColors.textBlack,
                  fontSize: Dimensions.fontSizeOverLarge,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.paddingSizeSmall,
          ),
          // Interests
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Wrap(
                spacing: Dimensions.paddingSizeSmall, // width
                runSpacing: Dimensions.paddingSizeSmall, // height
                children: interests.asMap().entries.map((entry) {
                  final index = entry.key;
                  final interest = entry.value;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        interests[index]["isSelected"] =
                            !interests[index]["isSelected"];
                      });
                    },
                    child: CustomInterestChip(
                      name: interest["name"],
                      isSelected: interest["isSelected"],
                      icon: Icons.restaurant,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: Dimensions.paddingSizeTwenty),

          // Buttons
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(FillProfileScreen());
                    },
                    child: CustomButton(
                      buttonText: AppString.skip,
                    ),
                  ),
                ),
                const SizedBox(width: Dimensions.paddingSizeSmall),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(FillProfileScreen());
                    },
                    child: CustomButton(
                      buttonText: AppString.continueText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
