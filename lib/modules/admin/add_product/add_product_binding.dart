import 'package:get/get.dart';
import 'add_product_viewmodel.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductViewModel>(() => AddProductViewModel());
  }
}

