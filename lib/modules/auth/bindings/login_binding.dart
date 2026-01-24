import 'package:get/get.dart';
import 'package:madlab/data/repositories/auth_repository.dart';
import 'package:madlab/data/repositories/user_repository.dart';
import 'package:madlab/app/services/auth_navigation_service.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<UserRepository>(() => UserRepository());
    Get.lazyPut<AuthNavigationService>(() => AuthNavigationService(
      Get.find<AuthRepository>(),
      Get.find<UserRepository>(),
    ));
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}

