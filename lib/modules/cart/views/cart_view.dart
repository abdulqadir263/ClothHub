import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../cart_viewmodel.dart';
import 'cart_shared_widgets.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<CartViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (viewModel.cartItems.isEmpty) {
          return _buildEmptyState();
        }
        return Column(
          children: [
            Expanded(child: buildCartList(viewModel)),
            buildCheckoutSection(context, viewModel),
          ],
        );
      }),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
          AppTheme.spacerMedium(),
          Text('Your cart is empty', style: AppTheme.captionText.copyWith(fontSize: 18)),
          AppTheme.spacerMedium(),
          AppTheme.primaryButton(
            text: 'Browse Products',
            onPressed: () => Get.toNamed('/product-list'),
            width: 200,
          ),
        ],
      ),
    );
  }
}
