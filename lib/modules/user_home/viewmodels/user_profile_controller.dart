// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProfileController extends GetxController {
//
//   final nameController = TextEditingController();
//   final ageController = TextEditingController();
//   final phoneController = TextEditingController();
//   final addressController = TextEditingController();
//   final RxString selectedGender = 'Male'.obs;
//
//   void saveProfile() {
//     final name = nameController.text.trim();
//     if (name.isEmpty) {
//       Get.snackbar('Validation', 'Please enter your name');
//       return;
//     }
//     Get.snackbar('Profile Saved', 'Welcome $name!');
//   }
//
//   @override
//   void onClose() {
//     nameController.dispose();
//     ageController.dispose();
//     phoneController.dispose();
//     addressController.dispose();
//     super.onClose();
//   }
// }
