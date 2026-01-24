import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/themes/app_theme.dart';
import '../../../../app/utils/helpers.dart';
import '../admin_order_viewmodel.dart';

class AdminOrderView extends StatelessWidget {
  const AdminOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminOrderViewModel viewModel = Get.find<AdminOrderViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Orders'),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (viewModel.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.orders.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt_long_outlined,
                  size: 80,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'No orders yet',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: viewModel.orders.length,
          itemBuilder: (context, index) {
            final order = viewModel.orders[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order #${order.orderId.substring(0, 8)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppHelpers.getStatusColor(order.status),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            order.status.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'User ID: ${order.userId.substring(0, 10)}...',
                      style: TextStyle(color: Colors.grey[600]),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Date: ${AppHelpers.formatDate(order.timestamp)}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Items: ${order.products.length}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),

                    const Divider(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: Rs. ${order.totalPrice.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppTheme.primary,
                          ),
                        ),
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            viewModel.updateStatus(order.orderId, value);
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'pending',
                              child: Text('Pending'),
                            ),
                            const PopupMenuItem(
                              value: 'processing',
                              child: Text('Processing'),
                            ),
                            const PopupMenuItem(
                              value: 'delivered',
                              child: Text('Delivered'),
                            ),
                            const PopupMenuItem(
                              value: 'cancelled',
                              child: Text('Cancelled'),
                            ),
                          ],
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Row(
                              children: [
                                Text('Update Status'),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

