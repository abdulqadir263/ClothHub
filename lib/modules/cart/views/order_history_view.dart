import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../../../app/routes/app_routes.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final mockOrders = [

      {'id': '001', 'total': 3200, 'date': '12 Nov 2025'},
      {'id': '002', 'total': 4500, 'date': '14 Nov 2025'},

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.offAllNamed(AppRoutes.userHome), // FIXED
        ),
      ),

      body: ListView.builder(
        itemCount: mockOrders.length,
        itemBuilder: (context, index)
        {
          final order = mockOrders[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(

              title: Text('Order #${order['id']}'),

              subtitle: Text('Date: ${order['date']}'),

              trailing: Text(
                'Rs. ${order['total']}',
                style: const TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ),
          );
        },
      ),
    );
  }
}
