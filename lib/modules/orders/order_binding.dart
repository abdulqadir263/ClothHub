import 'package:get/get.dart';
import 'order_viewmodel.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderViewModel>(() => OrderViewModel());
  }
}

