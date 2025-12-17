import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../cart_viewmodel.dart';
import '../widgets/cart_item_card.dart';

Widget buildCartList(CartViewModel viewModel) {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: viewModel.cartItems.length,
    itemBuilder: (context, index) {
      return CartItemCard(
        item: viewModel.cartItems[index],
        viewModel: viewModel,
      );
    },
  );
}

/// Shared widget for building the checkout section
Widget buildCheckoutSection(BuildContext context, CartViewModel viewModel) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 10,
          offset: const Offset(0, -5),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total:', style: AppTheme.subHeadingText),
            Text(
              'Rs. ${viewModel.totalPrice.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.primary),
            ),
          ],
        ),
        AppTheme.spacerMedium(),
        AppTheme.primaryButton(
          text: 'PROCEED TO CHECKOUT',
          onPressed: () => Get.toNamed('/checkout'),
        ),
      ],
    ),
  );
}
