// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
// import '../viewmodels/admin_controller.dart';
//
// class AdminOrderDetailView extends StatelessWidget {
//
//   final int orderIndex;
//   const AdminOrderDetailView({super.key, required this.orderIndex});
//
//   @override
//   Widget build(BuildContext context)
//   {
//     final AdminController c = Get.find<AdminController>();
//     final order = c.orders[orderIndex];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order #${order.id}'),
//         backgroundColor: AppTheme.primary,
//         foregroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             Text('Customer: ${order.customerName}',
//                 style: const TextStyle(fontSize: 16)
//             ),
//
//             const SizedBox(height: 8),
//
//             Text('Total Amount: Rs. ${order.totalAmount}',
//                 style: const TextStyle(
//                     fontSize: 16, color: AppTheme.primary)
//             ),
//
//             const SizedBox(height: 8),
//
//             Text('Date: ${order.date}',
//                 style: const TextStyle(fontSize: 16)
//             ),
//
//             const SizedBox(height: 12),
//
//             const Text('Order Status:',
//                 style: TextStyle(fontSize: 16)
//             ),
//
//             Obx(() {
//               return DropdownButton<String>(
//                 value: c.orders[orderIndex].status,
//                 items: ['Pending', 'Processing', 'Shipped', 'Delivered']
//                     .map((s) => DropdownMenuItem(value: s, child: Text(s)))
//                     .toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     c.updateOrderStatus(orderIndex, value);
//                   }
//                 },
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
