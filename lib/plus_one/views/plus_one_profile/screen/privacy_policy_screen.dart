import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_privacy_policy_container.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Get.back();},
            icon: Icon(Icons.arrow_back_ios)
        ),
        title: Text("Privacy Policy", style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          itemCount: 7,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomPrivacyPolicyContainer(),
              );
            },
        ),
      )
    );
  }
}
