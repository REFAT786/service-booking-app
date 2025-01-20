import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class CustomCurrentWeekContainer extends StatelessWidget {
  const CustomCurrentWeekContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 0, top: 8, bottom: 1),
      //width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.stoke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Mon", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Free"),
              SizedBox(width: 20,),
              IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.calendar_month, color: AppColors.primary,)
              )
            ]
          )
        ],
      )

    );
  }
}
