import 'package:get/get.dart';
import 'package:madlab/data/repositories/cart_repository.dart';
import 'product_detail_viewmodel.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartRepository>(() => CartRepository());
    Get.lazyPut<ProductDetailViewModel>(() => ProductDetailViewModel());
  }
}

