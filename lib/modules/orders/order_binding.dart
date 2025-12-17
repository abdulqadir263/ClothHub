import 'package:get/get.dart';
import 'package:madlab/data/repositories/order_repository.dart';
import 'package:madlab/data/repositories/auth_repository.dart';
import 'order_viewmodel.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(() => OrderRepository());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<OrderViewModel>(() => OrderViewModel());
  }
}

