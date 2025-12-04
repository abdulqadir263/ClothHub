// import 'package:get/get.dart';
// import '../../../data/models/product_model.dart';
//
// class CartController extends GetxController {
//
//   final RxList<ProductModel> cartItems = <ProductModel>[].obs;
//   final RxDouble totalPrice = 0.0.obs;
//
//   void addToCart(ProductModel product) {
//     cartItems.add(product);
//     _calculateTotal();
//     Get.snackbar('Added', '${product.name} added to cart',
//         snackPosition: SnackPosition.BOTTOM
//     );
//   }
//
//   void removeFromCart(ProductModel product) {
//     cartItems.removeWhere((p) => p.id == product.id);
//     _calculateTotal();
//     Get.snackbar('Removed', '${product.name} removed from cart',
//         snackPosition: SnackPosition.BOTTOM
//     );
//   }
//
//   void clearCart() {
//     cartItems.clear();
//     totalPrice.value = 0.0;
//   }
//
//   void _calculateTotal() {
//     double total = 0.0;
//     for (var item in cartItems)
//     {
//       total += item.price;
//     }
//     totalPrice.value = total;
//   }
//
//   bool isInCart(ProductModel product)
//   {
//     return cartItems.any((item) => item.id == product.id);
//   }
//
//   int get cartCount => cartItems.length;
// }
