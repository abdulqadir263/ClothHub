import 'package:get/get.dart';
import 'package:madlab/data/repositories/auth_repository.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}

