import 'package:get/get.dart';
import 'package:madlab/data/repositories/cart_repository.dart';
import 'package:madlab/data/repositories/auth_repository.dart';
import 'package:madlab/data/repositories/order_repository.dart';
import 'cart_viewmodel.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartRepository>(() => CartRepository());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<OrderRepository>(() => OrderRepository());
    Get.put<CartViewModel>(CartViewModel(), permanent: true);
  }
}

