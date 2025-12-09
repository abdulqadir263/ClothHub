import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';
import '../../app/utils/constants.dart';
import '../../data/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepo = AuthRepository();

  var isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    checkAuthStatus();
  }

  void checkAuthStatus() async {
    await Future.delayed(const Duration(milliseconds: 500));

    User? user = _authRepo.currentUser;

    if (user != null) {
      String email = user.email ?? '';
      if (AppConstants.adminEmails.contains(email.toLowerCase().trim())) {
        Get.offAllNamed(AppRoutes.adminDashboard);
      } else {
        bool profileComplete = await _authRepo.isProfileComplete(user.uid);
        if (profileComplete) {
          Get.offAllNamed(AppRoutes.userHome);
        } else {
          Get.offAllNamed(AppRoutes.profile);
        }
      }
    } else {
      Get.offAllNamed(AppRoutes.login);
    }

    isLoading.value = false;
  }
}

