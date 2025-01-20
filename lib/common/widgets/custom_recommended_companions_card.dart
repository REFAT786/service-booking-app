import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_string.dart';
import '../../utils/images.dart';

class CustomRecommendedCompanionsCard extends StatelessWidget {
  const CustomRecommendedCompanionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
            child: Image.network(Images.serviceShortPhoto, fit: BoxFit.fill,width: 300,height: 350,)),
        Positioned(
          bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(AppString.seeker, style: TextStyle(color: AppColors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              Text(AppString.seeker, style: TextStyle(color: AppColors.white, fontSize: 20),),
              ],
            ),
        ),

      ],
    );
  }
}
