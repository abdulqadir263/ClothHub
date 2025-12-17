import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cart_viewmodel.dart';
import 'cart_shared_widgets.dart';

class CartTabView extends StatelessWidget {
  const CartTabView({super.key});

  @override
  Widget build(BuildContext context) {

    final viewModel = Get.find<CartViewModel>();

    return Obx(() {
      if (viewModel.cartItems.isEmpty) {
        return _buildEmptyState();
      }

      return Column(
        children: [
          Expanded(child: buildCartList(viewModel)),
          buildCheckoutSection(context, viewModel),
        ],
      );
    });
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),

            child: Icon(
              Icons.shopping_cart_outlined,
              size: 60,
              color: Colors.grey[400],
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Add items to start shopping',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),

        ],
      ),
    );
  }
}
