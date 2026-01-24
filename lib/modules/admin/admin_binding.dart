import 'package:get/get.dart';
import 'package:madlab/data/repositories/auth_repository.dart';
import 'package:madlab/data/repositories/product_repository.dart';
import 'package:madlab/data/repositories/order_repository.dart';
import 'package:madlab/data/repositories/media_repository.dart';
import 'admin_viewmodel.dart';
import 'add_product/add_product_viewmodel.dart';
import 'admin_products/admin_products_viewmodel.dart';
import 'admin_orders/admin_order_viewmodel.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<ProductRepository>(() => ProductRepository());
    Get.lazyPut<OrderRepository>(() => OrderRepository());
    Get.lazyPut<MediaRepository>(() => MediaRepository());
    Get.lazyPut<AdminViewModel>(() => AdminViewModel());
    Get.lazyPut<AddProductViewModel>(() => AddProductViewModel());
    Get.lazyPut<AdminProductsViewModel>(() => AdminProductsViewModel());
    Get.lazyPut<AdminOrderViewModel>(() => AdminOrderViewModel());

  }
}
