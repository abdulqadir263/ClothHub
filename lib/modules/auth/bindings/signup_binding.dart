import 'package:get/get.dart';
import 'package:madlab/data/repositories/auth_repository.dart';
import '../viewmodels/signup_viewmodel.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<SignupViewModel>(() => SignupViewModel());
  }
}

