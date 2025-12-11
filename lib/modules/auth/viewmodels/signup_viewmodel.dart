import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../app/utils/constants.dart';
import '../../../data/repositories/auth_repository.dart';

class SignupViewModel extends GetxController {
  final AuthRepository authRepo = Get.find<AuthRepository>();

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
      await authRepo.signup(email, password);
      Get.snackbar("Success", "Account created successfully");
      navigateAfterSignup(email);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "SignUp Failed");
    } finally {
      isLoading.value = false;
    }
  }

  void navigateAfterSignup(String email) {
    if (authRepo.isLoggedIn) {
      if (AppConstants.adminEmails.contains(email.toLowerCase().trim())) {
        Get.offAllNamed('/admin-dashboard');
      } else {
        Get.offAllNamed('/profile');
      }
    }
  }
}
