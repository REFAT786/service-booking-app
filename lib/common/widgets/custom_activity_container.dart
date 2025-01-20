import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/app_color.dart';
import '../../../utils/dimensions.dart';

class CustomActivityContainer extends StatelessWidget {
   CustomActivityContainer({super.key, required this.name});
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor)

      ),
      child: Text(name,  style: TextStyle(
        color: Color(0xFF0C0C0C),
        fontSize: 13,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w800,
      ),),
    );
  }
}
