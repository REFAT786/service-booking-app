import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/images.dart';

class CustomMyUpcomingEvent extends StatelessWidget {
  const CustomMyUpcomingEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(8),
      //width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey ,
            spreadRadius: 0,
            blurRadius: 2,
            offset:  Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              child: Image(image: NetworkImage(Images.serviceCoverImage), height: 150, width: double.infinity ,fit: BoxFit.cover,)
          ),
          Padding(
              padding: EdgeInsets.only(left: 10,right: 10, top: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Text("Cooking Class", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,overflow: TextOverflow.ellipsis),),SizedBox(height: 5,),

                ListTile(
                  leading: Icon(Icons.calendar_month, color: AppColors.primary,),
                  title: Text("Oct 12"),
                ),
                ListTile(
                  leading: Icon(Icons.lock_clock, color: AppColors.primary,),
                  title: Text("11 AM"),
                ),
              ],
            ),
          ),

        ],
      ),

    );
  }
}
