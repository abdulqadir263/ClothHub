import 'package:get/get.dart';
import 'product_list_viewmodel.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListViewModel>(() => ProductListViewModel());
  }
}

