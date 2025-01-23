import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:service_booking_app/common/widgets/custom_button.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';
import 'event_screen.dart';

class CreateEventScreen extends StatefulWidget {
  CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final eventTitleController = TextEditingController();

  final eventDescriptionController = TextEditingController();

  //final String selectedDate = "Select Date";

  //final VoidCallback onTap;
  DateTime? selectedDate; // Holds the selected date


  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate:
      selectedDate ?? DateTime.now(), // Default to today or selected date
      firstDate: DateTime.now(), // Prevent picking past dates
      lastDate: DateTime(2100), // Limit the range to the year 2100
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  TimeOfDay? selectedTime; // Holds the selected time

  // Function to open the time picker dialog
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white,
            timePickerTheme: TimePickerThemeData(
              dialHandColor: Colors.blue,
              dialBackgroundColor: Colors.grey[200],
              hourMinuteTextColor: WidgetStateColor.resolveWith(
                    (states) => states.contains(WidgetState.selected)
                    ? Colors.blue
                    : Colors.black,
              ),
              hourMinuteShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  String? _selectedFilePath;

  String? _filePath;
  Future<void> _openFilePicker() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false, // Allow single file selection
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _filePath = result.files.single.path;
        });
      }
    } catch (e) {
      // Handle errors
      print("Error selecting file: $e");
    }
  }

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(AppString.createNewEvent,
            style: styleExtraBold.copyWith(
                fontSize: Dimensions.fontSizeOverLarge,
                color: AppColors.textBlack)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Column(
          children: [
            TextField(
              controller: eventTitleController,
              decoration: InputDecoration(
                fillColor: Color(0xffeff0f1),
                filled: true,
                hintText: AppString.eventTitle,
                contentPadding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(Dimensions.radiusTwelve),
                    borderSide: BorderSide.none),
                hintStyle: styleBold.copyWith(
                    fontSize: Dimensions.fontSizeDefault,
                    color: AppColors.secondary550),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: _openFilePicker, // Opens the file picker
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffeff0f1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _filePath == null
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.upload, color: Colors.grey),
                    Text(
                      "Upload Event Banner",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.upload, color: Colors.grey),
                    Text(
                      "Already Uploded",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_filePath != null)
              Text(
                "Uploaded File:\n$_filePath",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffeff0f1),
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              ),
              child: TextField(
                controller: eventDescriptionController,
                maxLines: Dimensions.textMaxLine, // Maximum number of lines
                maxLength: Dimensions.textMaxLength,
                decoration: InputDecoration(
                    counterText: "",
                    contentPadding:
                    EdgeInsets.all(Dimensions.paddingSizeDefault),
                    hintText: "Event Description",
                    hintStyle: styleNormal.copyWith(
                        fontSize: Dimensions.fontSizeDefault,
                        color: AppColors.secondary550),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: ()=> _pickImage(ImageSource.gallery),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffeff0f1),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.upload,
                      size: 32.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "Upload Description Image",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "(Optional)",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => _selectDate(context), // Show date picker when tapped
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Color(0xffeff0f1),
                  borderRadius: BorderRadius.circular(8.0),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.blue,
                          size: 20.0,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          selectedDate != null
                              ? DateFormat('MMMM d, yyyy').format(selectedDate!)
                              : "Event Date",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: selectedDate != null
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => _selectTime(context), // Show date picker when tapped
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Color(0xffeff0f1),
                  borderRadius: BorderRadius.circular(8.0),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.lock_clock,
                          color: Colors.blue,
                          size: 20.0,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          selectedDate != null
                              ? DateFormat('hh:mm a').format(selectedDate!)
                              : "Event Time",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: selectedDate != null
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffeff0f1),
                borderRadius: BorderRadius.circular(Dimensions.radiusTwelve),
              ),
              child: ListTile(
                leading: Icon(Icons.location_on, color: AppColors.primary,),
                title: Text("Location"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffeff0f1),
                borderRadius: BorderRadius.circular(Dimensions.radiusTwelve),
              ),
              child: ListTile(
                leading:Icon(Icons.filter_list, color: AppColors.primary,),//SvgPicture.asset(Images.filterIcon),
                title: Text("Max Participants"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffeff0f1),
                borderRadius: BorderRadius.circular(Dimensions.radiusTwelve),
              ),
              child: ListTile(
                leading: Icon(Icons.filter_list, color: AppColors.primary,),//SvgPicture.asset(Images.filterIcon),
                title: Text("Add co-host"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffeff0f1),
                borderRadius: BorderRadius.circular(Dimensions.radiusTwelve),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  Text("Add More")
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: (){Get.to(EventScreen());},
                child: CustomButton(buttonText: "Done",))
          ],
        ),
      ),
    );
  }
}
