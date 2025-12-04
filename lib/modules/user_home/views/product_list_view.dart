// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
// import '../viewmodels/user_home_controller.dart';
// import 'product_detail_view.dart';
//
// class ProductListView extends StatelessWidget {
//
//   final String category;
//   const ProductListView({super.key, required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final c = Get.find<UserHomeController>();
//
//     final products =
//     c.products.where((p) => p.category.toLowerCase() == category.toLowerCase()).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(category),
//         backgroundColor: AppTheme.primary,
//         foregroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: products.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.75,
//           mainAxisSpacing: 12,
//           crossAxisSpacing: 12,
//         ),
//
//         itemBuilder: (context, index) {
//           final p = products[index];
//           return GestureDetector(
//             onTap: () => Get.to(() => ProductDetailView(product: p)),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(14),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   )
//                 ],
//               ),
//               child: Column(
//
//                 children: [
//
//                   Expanded(
//                     child: ClipRRect(
//                       borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(14)
//                       ),
//
//                       child: Image.asset(p.imageUrl,
//                           fit: BoxFit.cover,
//                           width: double.infinity
//                       ),
//                     ),
//                   ),
//
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Column(
//
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//
//                         Text(
//                             p.name,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold)
//                         ),
//
//                         const SizedBox(height: 4),
//
//                         Text('Rs. ${p.price}',
//                             style: const TextStyle(
//                                 color: AppTheme.primary)
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
