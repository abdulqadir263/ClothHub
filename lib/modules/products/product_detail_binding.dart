import 'package:get/get.dart';
import 'product_detail_viewmodel.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailViewModel>(() => ProductDetailViewModel());
  }
}

