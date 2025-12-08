import 'package:get/get.dart';
import 'admin_order_viewmodel.dart';

class AdminOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminOrderViewModel>(() => AdminOrderViewModel());
  }
}

