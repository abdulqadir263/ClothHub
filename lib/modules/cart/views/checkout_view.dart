import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../../../app/routes/app_routes.dart';
import '../viewmodels/cart_controller.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {

    final CartController c = Get.find<CartController>();

    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text("Enter Your Details", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold)
              ),

              const SizedBox(height: 16),

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: addressController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Delivery Address',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              Obx(() => Text(
                'Total Amount: Rs. ${c.totalPrice.value}',
                style: const TextStyle(
                    fontSize: 18,
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold),
              )),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.trim().isEmpty ||
                        phoneController.text.trim().isEmpty ||
                        addressController.text.trim().isEmpty) {

                      Get.snackbar(
                        'Missing Information',
                        'Please fill all required fields.',
                        snackPosition: SnackPosition.BOTTOM,
                      );

                      return;
                    }

                    c.clearCart();

                    Get.offAllNamed(AppRoutes.orderSuccess);
                  },

                  child: const Text('Place Order', style: TextStyle(
                    color: Colors.white
                  ),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
