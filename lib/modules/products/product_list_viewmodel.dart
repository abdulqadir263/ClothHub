import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../data/repositories/product_repository.dart';

class ProductListViewModel extends GetxController {
  final ProductRepository productRepo = Get.find<ProductRepository>();

  var isLoading = false.obs;
  var products = <ProductModel>[].obs;
  var selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      if (selectedCategory.value == 'All') {
        products.value = await productRepo.getAllProducts();
      } else {
        products.value = await productRepo.getProductsByCategory(
          selectedCategory.value,
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load products');
    } finally {
      isLoading.value = false;
    }
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
    fetchProducts();
  }
}
