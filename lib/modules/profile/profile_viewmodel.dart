import 'package:get/get.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

class ProfileViewModel extends GetxController {
  final AuthRepository _authRepo = AuthRepository();

  var isLoading = false.obs;
  var fullName = ''.obs;
  var gender = 'Male'.obs;
  var age = 0.obs;
  var address = ''.obs;
  var phoneNumber = ''.obs;

  Future<void> saveProfile() async {
    if (fullName.value.isEmpty) {
      Get.snackbar('Error', 'Please enter your full name');
      return;
    }
    if (phoneNumber.value.isEmpty) {
      Get.snackbar('Error', 'Please enter your phone number');
      return;
    }
    if (address.value.isEmpty) {
      Get.snackbar('Error', 'Please enter your address');
      return;
    }

    isLoading.value = true;

    try {
      final currentUser = _authRepo.currentUser;
      if (currentUser == null) {
        Get.snackbar('Error', 'User not logged in');
        return;
      }

      final userModel = UserModel(
        uid: currentUser.uid,
        email: currentUser.email ?? '',
        fullName: fullName.value,
        gender: gender.value,
        age: age.value,
        address: address.value,
        phoneNumber: phoneNumber.value,
      );

      await _authRepo.saveUserProfile(userModel);
      Get.snackbar('Success', 'Profile saved successfully');
      Get.offAllNamed('/user-home');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save profile');
    } finally {
      isLoading.value = false;
    }
  }
}

