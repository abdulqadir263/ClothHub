import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../app/utils/constants.dart';
import '../../../data/repositories/auth_repository.dart';

class LoginViewModel extends GetxController {
  final AuthRepository authRepo = Get.find<AuthRepository>();

  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    if (!email.contains("@")) {
      Get.snackbar("Error", "Enter valid Email");
      return;
    }
    if (password.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters");
      return;
    }

    isLoading.value = true;
    try {
      await authRepo.login(email, password);
      Get.snackbar("Success", "Login successful");
      navigateAfterLogin(email);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Login Failed");
    } finally {
      isLoading.value = false;
    }
  }

  void navigateAfterLogin(String email) {
    if (authRepo.isLoggedIn) {
      if (AppConstants.adminEmails.contains(email.toLowerCase().trim())) {
        Get.offAllNamed('/admin-dashboard');
      } else {
        Get.offAllNamed('/user-home');
      }
    }
  }
}
