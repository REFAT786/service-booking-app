import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_booking_app/utils/dimensions.dart';

import '../../../../common/widgets/custom_interest_field.dart';
import '../../../../common/widgets/custom_search_box.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/images.dart';
import '../../../../utils/styles.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController = TextEditingController();

  String selectedOption = AppString.option1;
 // Default selected option
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(AppString.selectAnOption),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text(AppString.relevance),
                value: AppString.relevance,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                  Navigator.pop(context); // Close dialog after selection
                },
              ),
              RadioListTile<String>(
                title: const Text(AppString.rating),
                value: AppString.rating,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text(AppString.unselected),
                value: AppString.unselected,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeFifteen, vertical: Dimensions.paddingSizeExtraLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // AppBar Title
             Text(
              AppString.explore,
              style: styleExtraBold.copyWith(fontSize: Dimensions.fontSizeOverLarge, color: AppColors.textBlack),
            ),
            const SizedBox(height: Dimensions.paddingSizeTwenty),

            // Search Bar with Filter Button
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomSearchBox(
                    hintText: AppString.searchForEventsOrCompanions,
                    controller: searchController,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showFilterDialog(context);
                  },//SvgPicture.asset(Images.notificationIcon)
                  icon: SvgPicture.asset(Images.filterIcon)
                ),
              ],
            ),
            SizedBox(height: Dimensions.paddingSizeSmall,),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: 7,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(1),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                      child: CustomInterestField(name: AppString.coffee, icon: Icons.coffee),
                    );
                  },
              ),
            ),
            SizedBox(height: Dimensions.paddingSizeSmall,),
            Image.asset(Images.mapImage)

          ],
        ),
      ),
    );
  }
}
