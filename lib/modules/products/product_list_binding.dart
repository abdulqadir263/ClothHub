import 'package:get/get.dart';
import 'package:madlab/data/repositories/product_repository.dart';
import 'product_list_viewmodel.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(() => ProductRepository());
    Get.lazyPut<ProductListViewModel>(() => ProductListViewModel());
  }
}

