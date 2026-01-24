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
    _listenToProducts();
  }

  void _listenToProducts() {
    isLoading.value = true;

    Stream<List<ProductModel>> stream;
    if (selectedCategory.value == 'All') {
      stream = productRepo.getAllProducts();
    } else {
      stream = productRepo.getProductsByCategory(selectedCategory.value);
    }

    products.bindStream(stream);
    stream.listen((_) => isLoading.value = false);
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
    _listenToProducts();
  }
}
