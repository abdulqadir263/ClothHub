// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
// import '../../auth/viewmodels/auth_controller.dart';
// import '../viewmodels/admin_controller.dart';
//
// class AdminDashboardView extends StatelessWidget {
//   const AdminDashboardView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final AdminController c = Get.put(AdminController());
//     final AuthController auth = Get.find();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Admin Dashboard'),
//         centerTitle: true,
//         backgroundColor: AppTheme.primary,
//         foregroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         actions: [
//
//           IconButton(
//             icon: const Icon(Icons.people),
//             onPressed: () => Get.toNamed('/admin-users'),
//           ),
//
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               auth.currentUser.value = null;
//               Get.offAllNamed('/login');
//             },
//           ),
//
//         ],
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Obx(
//               () => SingleChildScrollView(
//             child: Column(
//               children: [
//
//                 _buildBox(
//                   icon: Icons.attach_money,
//                   title: 'Total Sales',
//                   value: 'Rs. ${c.totalSales.value}',
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 _buildBox(
//                   icon: Icons.inventory_2,
//                   title: 'Products',
//                   value: '${c.products.length}',
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 _buildBox(
//                   icon: Icons.receipt_long,
//                   title: 'Orders',
//                   value: '${c.orders.length}',
//                 ),
//
//                 const SizedBox(height: 30),
//
//                 ElevatedButton.icon(
//                   onPressed: () => Get.toNamed('/manage-products'),
//                   icon: const Icon(Icons.inventory),
//                   label: const Text('Manage Products'),
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(double.infinity, 50),
//                     foregroundColor: Colors.white
//                   ),
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 ElevatedButton.icon(
//                   onPressed: () => Get.toNamed('/manage-orders'),
//                   icon: const Icon(Icons.receipt_long),
//                   label: const Text('Manage Orders'),
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(double.infinity, 50),
//                       foregroundColor: Colors.white
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBox({required IconData icon, required String title, required String value})
//   {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey,
//             blurRadius: 2.5,
//           )
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 30, color: AppTheme.primary),
//           const SizedBox(width: 14),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               Text(title, style: const TextStyle(
//                   color: Colors.grey, fontSize: 14)
//               ),
//
//               Text(value, style: const TextStyle(
//                   fontWeight: FontWeight.bold, fontSize: 18)
//               ),
//
//             ],
//
//           )
//         ],
//       ),
//     );
//   }
// }
