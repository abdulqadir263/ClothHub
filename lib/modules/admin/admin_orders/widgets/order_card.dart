import 'package:flutter/material.dart';
import '../../../../app/themes/app_theme.dart';
import '../../../../data/models/order_model.dart';
import '../admin_order_viewmodel.dart';

/// Order card widget for admin orders list
class OrderCard extends StatelessWidget {
  final OrderModel order;
  final AdminOrderViewModel viewModel;
  const OrderCard({super.key, required this.order, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildHeader(), const SizedBox(height: 12), _buildOrderInfo(), const Divider(height: 24), _buildFooter(), _buildItemsExpansion()],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Order #${order.orderId.substring(0, 8)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(color: _getStatusColor(order.status), borderRadius: BorderRadius.circular(20)),
          child: Text(order.status.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }

  Widget _buildOrderInfo() {
    return Column(children: [
      _buildInfoRow(Icons.person, 'User: ${order.userId.substring(0, 10)}...'),
      const SizedBox(height: 6),
      _buildInfoRow(Icons.calendar_today, '${order.timestamp.day}/${order.timestamp.month}/${order.timestamp.year}'),
      const SizedBox(height: 6),
      _buildInfoRow(Icons.shopping_bag, '${order.products.length} item(s)'),
    ]);
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(children: [Icon(icon, size: 16, color: Colors.grey[600]), const SizedBox(width: 8), Text(text, style: TextStyle(color: Colors.grey[600]))]);
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total: Rs. ${order.totalPrice.toStringAsFixed(0)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.primary)),
        PopupMenuButton<String>(
          onSelected: (value) => viewModel.updateStatus(order.orderId, value),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          itemBuilder: (context) => [
            _buildStatusMenuItem('pending', 'Pending', Colors.orange),
            _buildStatusMenuItem('packed', 'Packed', Colors.blue),
            _buildStatusMenuItem('shipped', 'Shipped', Colors.purple),
            _buildStatusMenuItem('delivered', 'Delivered', Colors.green),
            _buildStatusMenuItem('cancelled', 'Cancelled', Colors.red),
          ],
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: AppTheme.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Text('Update', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.w600)),
              const SizedBox(width: 4),
              Icon(Icons.arrow_drop_down, color: AppTheme.primary),
            ]),
          ),
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildStatusMenuItem(String value, String label, Color color) {
    return PopupMenuItem(value: value, child: Row(children: [
      Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      const SizedBox(width: 12),
      Text(label),
    ]));
  }

  Widget _buildItemsExpansion() {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: const Text('View Items', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      children: order.products.map((item) => ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover,
            errorBuilder: (c, e, s) => Container(width: 50, height: 50, color: Colors.grey[200], child: const Icon(Icons.image, size: 20))),
        ),
        title: Text(item.name, style: const TextStyle(fontSize: 14)),
        subtitle: Text('Qty: ${item.quantity}'),
        trailing: Text('Rs. ${item.totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w600)),
      )).toList(),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending': return Colors.orange;
      case 'packed': return Colors.blue;
      case 'shipped': return Colors.purple;
      case 'delivered': return Colors.green;
      case 'cancelled': return Colors.red;
      default: return Colors.grey;
    }
  }
}
