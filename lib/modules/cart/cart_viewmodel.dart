import 'package:get/get.dart';
import '../../data/models/cart_item_model.dart';
import '../../data/models/order_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/order_repository.dart';

class CartViewModel extends GetxController {
  final OrderRepository _orderRepo = OrderRepository();
  final AuthRepository _authRepo = AuthRepository();

  var cartItems = <CartItemModel>[].obs;
  var isLoading = false.obs;

  double get totalPrice {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice;
    }
    return total;
  }

  int get itemCount => cartItems.length;

  void addToCart(CartItemModel item) {
    final existingIndex = cartItems.indexWhere(
      (cartItem) => cartItem.productId == item.productId,
    );

    if (existingIndex >= 0) {
      cartItems[existingIndex].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(item);
    }
  }

  void removeFromCart(String productId) {
    cartItems.removeWhere((item) => item.productId == productId);
  }

  void increaseQuantity(String productId) {
    final index = cartItems.indexWhere((item) => item.productId == productId);
    if (index >= 0) {
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  void decreaseQuantity(String productId) {
    final index = cartItems.indexWhere((item) => item.productId == productId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
        cartItems.refresh();
      } else {
        removeFromCart(productId);
      }
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  Future<void> placeOrder() async {
    if (cartItems.isEmpty) {
      Get.snackbar('Error', 'Cart is empty');
      return;
    }

    final currentUser = _authRepo.currentUser;
    if (currentUser == null) {
      Get.snackbar('Error', 'Please login first');
      return;
    }

    isLoading.value = true;

    try {
      final order = OrderModel(
        orderId: '',
        userId: currentUser.uid,
        products: List.from(cartItems),
        totalPrice: totalPrice,
        timestamp: DateTime.now(),
        status: 'pending',
      );

      await _orderRepo.createOrder(order);
      clearCart();
      Get.snackbar('Success', 'Order placed successfully');
      Get.offAllNamed('/user-home');
    } catch (e) {
      Get.snackbar('Error', 'Failed to place order');
    } finally {
      isLoading.value = false;
    }
  }
}

