import 'package:get/get.dart';
import '../../data/repositories/mock_repository.dart';
import 'viewmodels/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MockRepository>(() => MockRepository());
    Get.lazyPut<AuthController>(() => AuthController(Get.find()));
  }
}
