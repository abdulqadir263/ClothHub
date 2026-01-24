import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../app/services/auth_navigation_service.dart';
import '../../../data/repositories/auth_repository.dart';

class SignupViewModel extends GetxController {

  final AuthRepository _authRepo = Get.find<AuthRepository>();
  final AuthNavigationService _navigationService = Get.find<AuthNavigationService>();

  var isLoading = false.obs;

  Future<void> signup(String email, String password, String confirmPassword) async {
    if (!email.contains("@")) {
      Get.snackbar("Error", "Enter valid Email");
      return;
    }
    if (password.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters");
      return;
    }
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords must match");
      return;
    }

    isLoading.value = true;
    try {
      await _authRepo.signup(email, password);
      Get.snackbar("Success", "Account created successfully");

      await _navigationService.navigateBasedOnEmail(email);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "SignUp Failed");
    } finally {
      isLoading.value = false;
    }
  }
}
