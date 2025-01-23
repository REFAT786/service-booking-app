import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_booking_app/plus_one/features/auth/fill_profile/screen/fill_profile_screen.dart';
import '../../../../repository/auth_repository.dart';

class ChooseInterestController extends GetxController {
  AuthRepository authRepository = AuthRepository();
  final TextEditingController interestController = TextEditingController();
  final RxList<Map<String, dynamic>> interests = <Map<String, dynamic>>[
    {"name": "Hiking", "isSelected": false},
    {"name": "Dialog", "isSelected": false},
    {"name": "Coffee", "isSelected": false},
    {"name": "Reading", "isSelected": false},
    {"name": "Travel", "isSelected": false},
  ].obs;

  final isLoading = false.obs;

  void addInterest(String newInterest) {
    if (newInterest.trim().isEmpty) {
      Get.snackbar("Error", "Interest cannot be empty.");
      return;
    }

    if (interests.any((interest) => interest["name"].toLowerCase() == newInterest.trim().toLowerCase())) {
      Get.snackbar("Error", "This interest already exists.");
      return;
    }

    interests.add({"name": newInterest.trim(), "isSelected": true});
    interestController.clear();
  }

  void toggleSelection(int index) {
    interests[index]["isSelected"] = !interests[index]["isSelected"];
    interests.refresh();
  }

  Future<void> submitInterests() async {
    // Extract selected interests and cast to List<String>
    final selectedInterests = interests
        .where((interest) => interest["isSelected"])
        .map<String>((interest) => interest["name"] as String)
        .toList(); // Explicitly convert to List<String>

    if (selectedInterests.isEmpty) {
      Get.snackbar("Error", "Please select at least one interest.");
      return;
    }

    isLoading.value = true;

    try {
      final token = Get.arguments?['token'] ?? '';
      await authRepository.updateUserInterests(selectedInterests, token);
      Get.snackbar("Success", "Interests updated successfully.");
      Get.off(FillProfileScreen());
    } catch (e) {
      Get.snackbar("Error", "Failed to update interests: $e");
    } finally {
      isLoading.value = false;
    }

  }

  @override
  void onClose() {
    interestController.dispose();
    super.onClose();
  }

}
