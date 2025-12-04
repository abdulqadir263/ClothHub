import 'package:get/get.dart';
import '../auth/viewmodels/auth_vm.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure AuthViewModel singleton exists
    if (!Get.isRegistered<AuthViewModel>()) {
      Get.put<AuthViewModel>(AuthViewModel(), permanent: true);
    }
  }
}
