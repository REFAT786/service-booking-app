import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_booking_app/plus_one/features/auth/choose_interest/controller/choose_interest_controller.dart';
import 'package:service_booking_app/plus_one/features/auth/login/screen/login_screen.dart';
import 'package:service_booking_app/plus_one/repository/auth_repository.dart';

import '../../../../model/user_model.dart';


class FillProfileController extends GetxController {
  AuthRepository authRepository = AuthRepository();

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String? selectedGender;
  File? image;
  File? filePath;

  bool isLoading = false;
  UserModel? userModel;
  static String token = '';

  final List<String> genders = ['Male', 'Female', 'Other']; // Dropdown options

  //final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }

  Future<void> openFilePicker() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false, // Allow single file selection
      );

      if (result != null && result.files.isNotEmpty) {
        filePath = File(result.files.single.path!);
        update();
      }
    } catch (e) {
      // Handle errors
      print("Error selecting file: $e");
    }
  }

  void updateGender(String? gender) {
    selectedGender = gender;
    update();
  }

  Future<void> updateUserProfile() async {
    String fullName = nameController.text.trim();
    String about = bioController.text.trim();
    String phone = phoneNumberController.text.trim();

    if (fullName.isEmpty || about.isEmpty) {
      Get.snackbar("Error", "Full Name and About are required.");
      return;
    }
    isLoading = true;
    update();

    try {
      token = ChooseInterestController.token;
      final response = await authRepository.updateUserProfile(
        fullName: fullName,
        about: about,
        phone: phone,
        gender: selectedGender ?? '',
        image: image!,
        document: filePath!,
        token: token,
      );
      if(response["success"]){
        Get.snackbar("Success", "Profile updated successfully.");
        //print("Updated Profile: ${userModel?.toJson()}");
        Get.offAll(LoginScreen());

      }

    } catch (e, s) {
      Get.snackbar("Error", "An error occurred: $e");
      print(e);
      print(s);
      Get.snackbar("Error", "An error occurred: $s");
    }
    finally {
      isLoading = false;
      update();
    }
  }


}
