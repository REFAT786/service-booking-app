import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_booking_app/plus_one/features/auth/login/screen/login_screen.dart';
import 'package:service_booking_app/plus_one/repository/auth_repository.dart';
import 'package:http/http.dart' as http;

import '../../../../model/user_model.dart';


class FillProfileController extends GetxController {
  AuthRepository authRepository = AuthRepository();

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String? selectedGender;
  File? image;
  String? filePath = "";

  bool isLoading = false;
  UserModel? userModel;

  final List<String> genders = ['Male', 'Female', 'Other']; // Dropdown options


  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
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
        filePath = result.files.single.path;
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
    /*
    try {
      final token = Get.arguments?['token'] ?? '';
      /*
      final result =
      */
      await authRepository.updateUserProfile(
          {
            "fullName": nameController.text,
            "about": bioController.text,
            "phone": phoneNumberController.text,
            "gender": selectedGender ?? '',

          }, token);
      Get.snackbar('Success', 'Profile updated successfully');
      LoginScreen();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }

    //image: image!,
        //document: File(filePath!),

     */

    try {
      final token = Get.arguments?['token'] ?? '';

      if (image == null || filePath == null) {
        throw Exception("Image and document must be selected.");
      }

      final imageFile = await http.MultipartFile.fromPath(
        'image',
        image!.path,
      );
      final documentFile = await http.MultipartFile.fromPath(
        'document',
        filePath!,
      );

      final response  = await authRepository.updateUserProfileWithFiles(
        fields: {
          "fullName": nameController.text,
          "about": bioController.text,
          "phone": phoneNumberController.text,
        },
        files: [imageFile, documentFile],
        token: token,
      );
      userModel = response;
      Get.snackbar('Success', 'Profile updated successfully');
      update();
      print("Full Name : ${nameController.text}");
      print("Bio : ${bioController.text}");
      print("Phone Number : ${phoneNumberController.text}");
      print("Gender : $selectedGender");
      print("Image Path : $imageFile");
      print("File Path : $documentFile");
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print("Updated Profile: $response");
      LoginScreen();
    } catch (e, s) {
      Get.snackbar('Error', e.toString());
      print("Error updating profile with files: $e");
      print("Error updating profile with files: $s");

      print("Full Name : ${nameController.text}");
      print("Bio : ${bioController.text}");
      print("Phone Number : ${phoneNumberController.text}");
      print("Gender : $selectedGender");
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    }

  }


}
