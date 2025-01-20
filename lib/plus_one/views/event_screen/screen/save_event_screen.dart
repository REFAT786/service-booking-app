import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/common/widgets/custom_my_upcoming_event.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';
import 'my_event_details_screen.dart';

class SaveEventScreen extends StatelessWidget {
  const SaveEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          "Save Event",
          style: styleExtraBold.copyWith(
              fontSize: Dimensions.fontSizeOverLarge,
              color: AppColors.textBlack),
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: (){Get.to(MyEventDetailsScreen());},
                  child: CustomMyUpcomingEvent()),
            );
          },
      ),

    );
  }
}
