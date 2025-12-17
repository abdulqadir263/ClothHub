import 'package:get/get.dart';
import 'package:madlab/data/repositories/auth_repository.dart';
import 'package:madlab/data/repositories/user_repository.dart';
import 'package:madlab/data/repositories/product_repository.dart';
import 'package:madlab/data/repositories/order_repository.dart';
import 'user_home_viewmodel.dart';
import '../products/product_list_viewmodel.dart';
import '../orders/order_viewmodel.dart';

class UserHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<UserRepository>(() => UserRepository());
    Get.lazyPut<ProductRepository>(() => ProductRepository());
    Get.lazyPut<OrderRepository>(() => OrderRepository());
    Get.lazyPut<UserHomeViewModel>(() => UserHomeViewModel());
    Get.lazyPut<ProductListViewModel>(() => ProductListViewModel());
    Get.lazyPut<OrderViewModel>(() => OrderViewModel());
  }
}
