import 'package:get/get.dart';
import 'user_home_viewmodel.dart';

class UserHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserHomeViewModel>(() => UserHomeViewModel());
  }
}
