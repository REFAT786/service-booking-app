import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FillProfileController extends GetxController{

  static FillProfileController get instance => Get.put(FillProfileController());

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String? selectedGender;


}