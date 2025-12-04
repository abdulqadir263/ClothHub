// import 'package:get/get.dart';
// import '../../../data/models/product_model.dart';
// import '../../../data/models/order_model.dart';
//
// class AdminController extends GetxController
// {
//   final RxList<ProductModel> products = <ProductModel>[].obs;
//   final RxList<OrderModel> orders = <OrderModel>[].obs;
//   final RxList<Map<String, String>> users = <Map<String, String>>[].obs;
//   final RxDouble totalSales = 0.0.obs;
//
//   final repo = MockDataRepository();
//
//   @override
//   void onInit()
//   {
//     super.onInit();
//     _loadMockData();
//   }
//
//   void _loadMockData()
//   {
//     products.assignAll(repo.getProducts());
//     orders.assignAll(repo.getOrders());
//     users.assignAll(repo.getUsers());
//
//     totalSales.value = orders.fold<double>(0.0, (sum, o) => sum + o.totalAmount);
//   }
//
//   void addProduct(String name, double price, String description)
//   {
//     final product = ProductModel(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       name: name,
//       description: description,
//       price: price,
//       imageUrl: 'assets/banners/banner1.jpg', // placeholder
//       category: 'Uncategorized',
//       sizes: ['S', 'M', 'L'],
//       isStitched: false,
//     );
//
//     products.add(product);
//
//     Get.snackbar(
//       'Product Added',
//       '${product.name} added successfully',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   void deleteProduct(ProductModel product)
//   {
//     products.removeWhere((p) => p.id == product.id);
//     Get.snackbar('Product Deleted',
//         '${product.name} removed',
//         snackPosition: SnackPosition.BOTTOM
//     );
//   }
//
//   void updateOrderStatus(int index, String newStatus)
//   {
//     if (index < 0 || index >= orders.length) return;
//
//     final old = orders[index];
//     final updated = OrderModel(
//       id: old.id,
//       customerName: old.customerName,
//       totalAmount: old.totalAmount,
//       status: newStatus,
//       date: old.date,
//       products: old.products,
//     );
//
//     orders[index] = updated;
//     orders.refresh();
//
//     totalSales.value = orders.fold<double>(0.0, (sum, o) => sum + o.totalAmount);
//
//     Get.snackbar(
//       'Order Updated',
//       'Status changed to $newStatus',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   void deleteUser(String userId)
//   {
//     users.removeWhere((u) => u['id'] == userId);
//     users.refresh();
//
//     Get.snackbar(
//       'User Deleted',
//       'User removed successfully',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
// }
