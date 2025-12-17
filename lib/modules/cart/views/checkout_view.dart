import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../cart_viewmodel.dart';

/// Checkout View - Order summary and place order page
class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<CartViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Obx(() => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Order Summary', style: AppTheme.subHeadingText),
                  AppTheme.spacerMedium(),
                  _buildItemsList(viewModel),
                  const Divider(height: 32),
                  _buildPriceRow('Subtotal:', 'Rs. ${viewModel.totalPrice.toStringAsFixed(0)}'),
                  AppTheme.spacerSmall(),
                  _buildPriceRow('Delivery:', 'Free', isGreen: true),
                  const Divider(height: 32),
                  _buildTotalRow(viewModel),
                ],
              ),
            ),
          ),
          _buildPlaceOrderButton(viewModel),
        ],
      )),
    );
  }

  Widget _buildItemsList(CartViewModel viewModel) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewModel.cartItems.length,
      itemBuilder: (context, index) {
        final item = viewModel.cartItems[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(item.imageUrl, width: 60, height: 60, fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(width: 60, height: 60, color: Colors.grey[300], child: const Icon(Icons.image))),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text('Qty: ${item.quantity}', style: TextStyle(color: Colors.grey[600])),
                ]),
              ),
              Text('Rs. ${item.totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isGreen = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isGreen ? Colors.green[700] : null)),
      ],
    );
  }

  Widget _buildTotalRow(CartViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text('Rs. ${viewModel.totalPrice.toStringAsFixed(0)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.primary)),
      ],
    );
  }

  Widget _buildPlaceOrderButton(CartViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, -5))],
      ),
      child: AppTheme.primaryButton(
        text: 'PLACE ORDER',
        onPressed: () => viewModel.placeOrder(),
        isLoading: viewModel.isLoading.value,
      ),
    );
  }
}

