import 'package:get/get.dart';
import '../../data/models/cart_item_model.dart';
import '../../data/models/order_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/repositories/cart_repository.dart';

class CartViewModel extends GetxController {

  final CartRepository _cartRepo = Get.find<CartRepository>();

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

  String? get _userId => Get.find<AuthRepository>().currentUser?.uid;

  @override
  void onInit() {
    super.onInit();
    _listenToCart();
  }

  void _listenToCart() {
    if (_userId == null) {
      print('User ID is null, cannot listen to cart.');
      return;
    }

    isLoading.value = true;
    print('Listening to cart for user ID: $_userId');

    final stream = _cartRepo.fetchCart(_userId!);

    cartItems.bindStream(stream);
    stream.listen(
      (items)
      {
        print('Cart items updated: ${items.length} items');
        isLoading.value = false;
      },

      onError: (error) {
        print('Error listening to cart: $error');
        isLoading.value = false;
      },

    );
  }

  Future<void> addToCart(CartItemModel item) async
  {
    if (_userId == null) {
      Get.snackbar('Error', 'Please login first');
      return;
    }

    final existingIndex = cartItems.indexWhere(
      (cartItem) => cartItem.productId == item.productId,
    );

    if (existingIndex >= 0) {
      await _cartRepo.updateQuantity(
        _userId!,
        item.productId,
        cartItems[existingIndex].quantity + 1,
      );
    } else
    {
      await _cartRepo.addToCart(_userId!, item);
    }
  }

  Future<void> removeFromCart(String productId) async
  {
    if (_userId == null) return;
    await _cartRepo.removeFromCart(_userId!, productId);
  }

  Future<void> increaseQuantity(String productId) async
  {
    if (_userId == null) return;

    final index = cartItems.indexWhere((item) => item.productId == productId);
    if (index >= 0) {
      await _cartRepo.updateQuantity(
        _userId!,
        productId,
        cartItems[index].quantity + 1,
      );
    }
  }

  Future<void> decreaseQuantity(String productId) async {
    if (_userId == null) return;

    final index = cartItems.indexWhere((item) => item.productId == productId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        await _cartRepo.updateQuantity(
          _userId!,
          productId,
          cartItems[index].quantity - 1,
        );
      } else {
        await removeFromCart(productId);
      }
    }
  }

  Future<void> clearCart() async {
    if (_userId == null) return;
    await _cartRepo.clearCart(_userId!);
  }

  Future<void> placeOrder() async {
    if (cartItems.isEmpty) {
      Get.snackbar('Error', 'Cart is empty');
      return;
    }

    final authRepo = Get.find<AuthRepository>();
    final orderRepo = Get.find<OrderRepository>();

    final currentUser = authRepo.currentUser;
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

      await orderRepo.createOrder(order);
      await clearCart();
      Get.snackbar('Success', 'Order placed successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to place order');
    } finally {
      isLoading.value = false;
    }
  }
}
