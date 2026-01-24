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
    _listenToProducts();
  }

  void _listenToProducts() {

    isLoading.value = true;

    final stream = productRepo.getAllProducts();
    products.bindStream(stream);
    stream.listen((_) => isLoading.value = false);

  }

  void fetchAllProducts() {
    _listenToProducts();
  }

  Future<void> deleteProduct(String productId) async {
    try
    {
      await productRepo.deleteProduct(productId);
      Get.snackbar('Success', 'Product deleted');
    }
    catch (e) {
      Get.snackbar('Error', 'Failed to delete product');
    }
  }
}
