// import 'package:get/get.dart';
// import '../../../data/models/product_model.dart';
// import '../../../data/models/category_model.dart';
//
// class UserHomeController extends GetxController {
//
//   final RxInt selectedIndex = 0.obs;
//
//   final RxList<CategoryModel> categories = <CategoryModel>[].obs;
//   final RxList<ProductModel> products = <ProductModel>[].obs;
//
//   final RxString selectedCategory = ''.obs;
//
//   final repo = MockDataRepository();
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadMockData();
//   }
//
//   void _loadMockData() {
//     categories.assignAll(repo.getCategories());
//     products.assignAll(repo.getProducts());
//   }
//
//   List<ProductModel> getProductsByCategory(String categoryName) {
//     return products.where((p) => p.category == categoryName).toList();
//   }
//
//   void onItemTapped(int index) {
//     selectedIndex.value = index;
//   }
// }
