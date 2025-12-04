import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../viewmodels/cart_controller.dart';
import '../../../app/routes/app_routes.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {

    final CartController c = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),

      body: Obx(()
      {
        if (c.cartItems.isEmpty) {
          return const Center(
            child: Text(
              'Your cart is empty',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: c.cartItems.length,
                itemBuilder: (context, index) {
                  final product = c.cartItems[index];

                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: ListTile(
                      leading: Image.asset(product.imageUrl,
                          width: 60,
                          fit: BoxFit.cover
                      ),
                      title: Text(product.name),

                      subtitle: Text('Rs. ${product.price}'),

                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => c.removeFromCart(product),
                      ),
                    ),
                  );
                },
              ),
            ),

            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Text(
                        'Total:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      Text(
                        'Rs. ${c.totalPrice.value}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primary),
                      ),
                    ],
                  )),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(AppRoutes.checkout),
                      child: const Text('Proceed to Checkout',style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                  ),

                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
