import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../app/services/auth_navigation_service.dart';
import '../../../data/repositories/auth_repository.dart';

class LoginViewModel extends GetxController {

  final AuthRepository _authRepo = Get.find<AuthRepository>();
  final AuthNavigationService _navigationService = Get.find<AuthNavigationService>();

  var isLoading = false.obs;

  Future<void> login(String email, String password) async
  {
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
      await _authRepo.login(email, password);
      Get.snackbar("Success", "Login successful");

      await _navigationService.navigateBasedOnEmail(email);

    } on FirebaseAuthException catch (e)
    {
      Get.snackbar("Error", e.message ?? "Login Failed");
    }
    finally {
      isLoading.value = false;
    }
  }
}
