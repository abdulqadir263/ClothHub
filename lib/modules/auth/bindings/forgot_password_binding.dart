import 'package:get/get.dart';
import '../viewmodels/forgot_password_viewmodel.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordViewModel>(() => ForgotPasswordViewModel());
  }
}

