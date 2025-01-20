import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';

class CustomMutualConnectionCard extends StatelessWidget {
  const CustomMutualConnectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.grey ,
            spreadRadius: 0,
            blurRadius: 2,
            offset:  Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image(image: NetworkImage(Images.serviceShortPhoto), height: 100, width: double.infinity,fit: BoxFit.cover,)
            ),
            Padding(
                padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  SizedBox(
                      width: 160,
                      child: Text("Amélie Claire Dupont ", style: styleBold.copyWith(fontSize: 16, overflow: TextOverflow.ellipsis),maxLines: 1,)),
                  SizedBox(
                      width: 160,
                      child: Text("Location", style: styleNormal.copyWith(color: AppColors.subTitleColor,overflow: TextOverflow.ellipsis),maxLines: 1))

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
