import 'package:get/get.dart';
import 'package:madlab/data/repositories/auth_repository.dart';
import '../viewmodels/forgot_password_viewmodel.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<ForgotPasswordViewModel>(() => ForgotPasswordViewModel());
  }
}

