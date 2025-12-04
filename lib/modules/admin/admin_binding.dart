import 'package:get/get.dart';
import '../auth/viewmodels/auth_vm.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthViewModel>(() => AuthViewModel());
  }
}
