import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../data/models/cart_item_model.dart';
import '../cart/cart_viewmodel.dart';

class ProductDetailViewModel extends GetxController {
  var product = Rxn<ProductModel>();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null && args is ProductModel) {
      product.value = args;
    }
  }

  Future<void> addToCart() async {
    if (product.value == null) return;

    final cartViewModel = Get.find<CartViewModel>();
    final cartItem = CartItemModel(
      productId: product.value!.id,
      name: product.value!.name,
      price: product.value!.price,
      imageUrl: product.value!.imageUrl,
      quantity: 1,
    );

    await cartViewModel.addToCart(cartItem);
    Get.snackbar('Success', 'Added to cart');
  }
}
