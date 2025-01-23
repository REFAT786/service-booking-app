import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/custom_button.dart';
import '../../../../../../common/widgets/custom_interest_chip.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/app_string.dart';
import '../../../../../../utils/dimensions.dart';
import '../../../../../../utils/styles.dart';
import '../controller/choose_interest_controller.dart';

class ChooseInterestScreen extends StatelessWidget {
  final ChooseInterestController _controller = Get.put(ChooseInterestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.chooseYourInterest,style: styleExtraBold.copyWith(color: AppColors.textBlack, fontSize: 24),),
        centerTitle: true,
        //backgroundColor: AppColors.primary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: Dimensions.paddingSizeSmall),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
            child: ElevatedButton.icon(
              onPressed: () => _showAddInterestDialog(context),
              icon: const Icon(Icons.add, color: Colors.white),
              label: Text(
                "Add Interest",
                style: styleBold.copyWith(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          // Interest Chips
          Expanded(
            child: Obx(() {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                child: Wrap(
                  spacing: Dimensions.paddingSizeSmall,
                  runSpacing: Dimensions.paddingSizeSmall,
                  children: _controller.interests.asMap().entries.map((entry) {
                    final index = entry.key;
                    final interest = entry.value;

                    return GestureDetector(
                      onTap: () => _controller.toggleSelection(index),
                      child: CustomInterestChip(
                        name: interest["name"],
                        isSelected: interest["isSelected"],
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
          ),

           SizedBox(height: Dimensions.paddingSizeSmall),

          // Continue Button
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Obx(() {
              return InkWell(
                onTap: _controller.submitInterests,
                child: CustomButton(
                  buttonText: AppString.continueText,
                  isLoading: _controller.isLoading.value,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showAddInterestDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          "Add New Interest",
          style: styleBold.copyWith(color: AppColors.textBlack, fontSize: 20),
        ),
        content: TextField(
          controller: _controller.interestController,
          decoration: InputDecoration(
            hintText: "Enter your interest",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              _controller.interestController.clear();
            },
            child: Text("Cancel", style: styleBold.copyWith(color: AppColors.grey, fontSize: 16)),
          ),
          TextButton(
            onPressed: () {
              _controller.addInterest(_controller.interestController.text);
              Get.back();
            },
            child: Text("Add", style: styleBold.copyWith(color: AppColors.primary, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
