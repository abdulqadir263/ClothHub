import 'package:get/get.dart';
import 'viewmodels/auth_vm.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthViewModel>(() => AuthViewModel());
  }
}
