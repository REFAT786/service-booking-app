import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';


class CustomInterestField extends StatelessWidget {
   CustomInterestField({super.key, required this.name, required this.icon});
  String name;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor),

      ),
      child: Row(
        children: [
          Text(name,  style: TextStyle(
            color: Color(0xFF0C0C0C),
            fontSize: 13,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w800,
          ),),
          Icon(icon, size: 16,),

        ],
      ),
    );
  }
}
