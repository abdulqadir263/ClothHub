import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../admin_order_viewmodel.dart';
import '../widgets/order_card.dart';

/// Admin Orders Tab - Displays all orders with management options
class AdminOrdersTabView extends StatelessWidget {
  const AdminOrdersTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<AdminOrderViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with title and refresh button
        _buildHeader(viewModel),

        // Orders list
        Expanded(child: _buildOrdersList(viewModel)),
      ],
    );
  }

  /// Builds the header section
  Widget _buildHeader(AdminOrderViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'All Orders',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () => viewModel.fetchAllOrders(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }

  /// Builds the orders list or empty/loading state
  Widget _buildOrdersList(AdminOrderViewModel viewModel) {
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
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: viewModel.orders.length,
        itemBuilder: (context, index) {
          return OrderCard(
            order: viewModel.orders[index],
            viewModel: viewModel,
          );
        },
      );
    });
  }

  /// Builds empty state widget
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No orders yet',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

