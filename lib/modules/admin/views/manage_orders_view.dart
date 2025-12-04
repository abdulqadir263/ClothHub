// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
// import '../viewmodels/admin_controller.dart';
// import 'order_detail_view.dart';
//
// class ManageOrdersView extends StatelessWidget {
//   const ManageOrdersView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final AdminController c = Get.find<AdminController>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manage Orders'),
//         backgroundColor: AppTheme.primary,
//         foregroundColor: Colors.white,
//
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//
//       ),
//
//       body: Obx(()
//       {
//         return ListView.builder(
//           padding: const EdgeInsets.all(12),
//           itemCount: c.orders.length,
//           itemBuilder: (context, index)
//           {
//             final o = c.orders[index];
//             return Card(
//
//               child: ListTile(
//
//                 title: Text('Order #${o.id}'),
//                 subtitle: Text(
//                     'Total: Rs. ${o.totalAmount}\nStatus: ${o.status}'
//                 ),
//                 trailing: const Icon(Icons.arrow_forward_ios, size: 18),
//
//                 onTap: () => Get.to(() =>
//                     AdminOrderDetailView(
//                     orderIndex: index
//                 )),
//
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
