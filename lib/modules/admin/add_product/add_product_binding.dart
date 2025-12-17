import 'package:get/get.dart';
import 'package:madlab/data/repositories/product_repository.dart';
import 'add_product_viewmodel.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(() => ProductRepository());
    Get.lazyPut<AddProductViewModel>(() => AddProductViewModel());
  }
}

