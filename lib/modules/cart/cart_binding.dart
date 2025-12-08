import 'package:get/get.dart';
import 'cart_viewmodel.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CartViewModel>(CartViewModel(), permanent: true);
  }
}

