import 'package:get/get.dart';
import 'package:madlab/data/repositories/order_repository.dart';
import 'admin_order_viewmodel.dart';

class AdminOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(() => OrderRepository());
    Get.lazyPut<AdminOrderViewModel>(() => AdminOrderViewModel());
  }
}

