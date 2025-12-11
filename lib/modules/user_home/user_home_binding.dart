import 'package:get/get.dart';
import 'user_home_viewmodel.dart';
import '../products/product_list_viewmodel.dart';
import '../orders/order_viewmodel.dart';

class UserHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserHomeViewModel>(() => UserHomeViewModel());
    Get.lazyPut<ProductListViewModel>(() => ProductListViewModel());
    Get.lazyPut<OrderViewModel>(() => OrderViewModel());
  }
}
