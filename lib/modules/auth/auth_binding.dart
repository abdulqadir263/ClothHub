import 'package:get/get.dart';
import 'viewmodels/auth_vm.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Use Get.put to ensure singleton instance
    if (!Get.isRegistered<AuthViewModel>()) {
      Get.put<AuthViewModel>(AuthViewModel(), permanent: true);
    }
  }
}
