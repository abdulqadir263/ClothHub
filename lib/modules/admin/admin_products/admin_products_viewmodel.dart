import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repositories/product_repository.dart';

class AdminProductsViewModel extends GetxController {
  final ProductRepository productRepo = Get.find<ProductRepository>();

  var isLoading = false.obs;
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

  Future<void> fetchAllProducts() async {
    isLoading.value = true;
    try {
      products.value = await productRepo.getAllProducts();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load products');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await productRepo.deleteProduct(productId);
      products.removeWhere((p) => p.id == productId);
      Get.snackbar('Success', 'Product deleted');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete product');
    }
  }
}
