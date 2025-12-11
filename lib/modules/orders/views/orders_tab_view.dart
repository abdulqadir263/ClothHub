import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../order_viewmodel.dart';
import '../widgets/user_order_card.dart';

/// Orders Tab - Displays user's order history
class OrdersTabView extends StatelessWidget {
  const OrdersTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<OrderViewModel>();

    return Obx(() {
      // Loading state
      if (viewModel.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      // Empty state
      if (viewModel.orders.isEmpty) {
        return _buildEmptyState();
      }

      // Orders list
      return RefreshIndicator(
        onRefresh: () => viewModel.fetchUserOrders(),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: viewModel.orders.length,
          itemBuilder: (context, index) {
            return UserOrderCard(order: viewModel.orders[index]);
          },
        ),
      );
    });
  }

  /// Empty state widget
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
              Icons.receipt_long_outlined,
              size: 60,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No orders yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your order history will appear here',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}

