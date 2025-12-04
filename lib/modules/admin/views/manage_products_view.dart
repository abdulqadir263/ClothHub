// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
// import '../viewmodels/admin_controller.dart';
// import 'add_product_view.dart';
//
// class ManageProductsView extends StatelessWidget {
//   const ManageProductsView({super.key});
//
//   @override
//   Widget build(BuildContext context)
//   {
//     final AdminController c = Get.find<AdminController>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manage Products'),
//         backgroundColor: AppTheme.primary,
//         foregroundColor: Colors.white,
//         actions: [
//
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () => Get.to(() => const AddProductView()),
//           ),
//
//         ],
//       ),
//
//       body: Obx(()
//       {
//         if (c.products.isEmpty)
//         {
//           return const Center(child: Text('No products added.'));
//         }
//
//         return ListView.builder(
//
//           itemCount: c.products.length,
//           itemBuilder: (context, index)
//           {
//             final p = c.products[index];
//
//             return LayoutBuilder(
//               builder: (context, constraints)
//               {
//                 double imgSize = constraints.maxWidth * 0.08;
//
//                 return Card(
//                   margin: const EdgeInsets.all(10),
//                   child: ListTile(
//                     leading: ClipRRect(
//                       borderRadius: BorderRadius.circular(6),
//                       child: Image.asset(
//                         p.imageUrl,
//                         width: imgSize,
//                         height: imgSize,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//
//                     title: Text(
//                       p.name,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//
//                     subtitle: Text('Rs. ${p.price}  |  ${p.category}'),
//
//                     trailing: IconButton(
//                       icon: const Icon(Icons.delete,
//                           color: Colors.red
//                       ),
//                       onPressed: () => c.deleteProduct(p),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         );
//       }),
//     );
//   }
// }
