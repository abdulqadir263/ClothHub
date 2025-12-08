import 'package:get/get.dart';
import 'admin_viewmodel.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminViewModel>(() => AdminViewModel());
  }
}
