import 'package:flutter/material.dart';
import '../../../app/themes/app_theme.dart';
import '../../../data/models/order_model.dart';

/// Order card widget for user's order list
class UserOrderCard extends StatelessWidget {
  final OrderModel order;

  const UserOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 12),
            _buildOrderInfo(),
            const Divider(height: 24),
            _buildTotalRow(),
            const SizedBox(height: 12),
            _buildItemsExpansion(),
          ],
        ),
      ),
    );
  }

  /// Header with order ID and status badge
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order #${order.orderId.substring(0, 8)}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _getStatusColor(order.status),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            order.status.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  /// Order date and items count
  Widget _buildOrderInfo() {
    return Column(
      children: [
        _buildInfoRow(Icons.calendar_today, _formatDate(order.timestamp)),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.shopping_bag, '${order.products.length} item(s)'),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  /// Total price row
  Widget _buildTotalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        Text(
          'Rs. ${order.totalPrice.toStringAsFixed(0)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppTheme.primary,
          ),
        ),
      ],
    );
  }

  /// Expandable items list
  Widget _buildItemsExpansion() {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: const Text(
        'View Items',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      children: order.products.map((item) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey[200],
                  child: const Icon(Icons.image, size: 20),
                );
              },
            ),
          ),
          title: Text(item.name, style: const TextStyle(fontSize: 14)),
          subtitle: Text('Qty: ${item.quantity}'),
          trailing: Text(
            'Rs. ${item.totalPrice.toStringAsFixed(0)}',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        );
      }).toList(),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'packed':
        return Colors.blue;
      case 'shipped':
        return Colors.purple;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
