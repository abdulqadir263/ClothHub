import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../data/repositories/auth_repository.dart';

class ForgotPasswordViewModel extends GetxController {
  final AuthRepository _authRepo = AuthRepository();

  var isLoading = false.obs;

  Future<void> resetPassword(String email) async {
    if (!email.contains("@")) {
      Get.snackbar("Error", "Enter valid Email");
      return;
    }

    isLoading.value = true;
    try {
      await _authRepo.sendPasswordResetEmail(email);
      Get.snackbar("Reset Password", "An email has been sent to you at $email");
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Failed to send reset password email");
    } finally {
      isLoading.value = false;
    }
  }
}
