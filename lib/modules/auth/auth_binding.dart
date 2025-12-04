import 'package:get/get.dart';
import 'viewmodels/auth_vm.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthViewModel>()) {
      Get.put<AuthViewModel>(AuthViewModel(), permanent: true);
    }
  }
}
