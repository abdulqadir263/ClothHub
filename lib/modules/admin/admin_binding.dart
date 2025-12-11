import 'package:get/get.dart';
import 'admin_viewmodel.dart';
import 'add_product/add_product_viewmodel.dart';
import 'admin_products/admin_products_viewmodel.dart';
import 'admin_orders/admin_order_viewmodel.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminViewModel>(() => AdminViewModel());
    Get.lazyPut<AddProductViewModel>(() => AddProductViewModel());
    Get.lazyPut<AdminProductsViewModel>(() => AdminProductsViewModel());
    Get.lazyPut<AdminOrderViewModel>(() => AdminOrderViewModel());
  }
}
