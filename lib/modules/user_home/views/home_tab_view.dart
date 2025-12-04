// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
// import '../viewmodels/user_home_controller.dart';
// import '../../cart/views/order_history_view.dart';
// import 'product_detail_view.dart';
//
// class HomeTabView extends StatelessWidget {
//   const HomeTabView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final c = Get.find<UserHomeController>();
//     double w = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ClothHub"),
//         centerTitle: true,
//         backgroundColor: AppTheme.primary,
//         foregroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//       ),
//
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               _banner(context),
//
//               const SizedBox(height: 20),
//
//               GestureDetector(
//                 onTap: () => Get.to(() => const OrderHistoryView()),
//                 child: Container(
//                   padding: EdgeInsets.all(w * 0.04),
//                   decoration: BoxDecoration(
//                     color: AppTheme.primary.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.receipt_long, color: AppTheme.primary, size: 28),
//                       const SizedBox(width: 12),
//                       const Text(
//                         "My Orders",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: AppTheme.primary,
//                         ),
//                       ),
//                       const Spacer(),
//                       const Icon(Icons.arrow_forward_ios, size: 18, color: AppTheme.primary),
//                     ],
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 26),
//
//               Text("Featured Products", style: _sectionTitle),
//               const SizedBox(height: 10),
//
//               _featuredProducts(context, c),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _banner(BuildContext context) {
//     double h = MediaQuery.of(context).size.height * 0.5;
//
//     return Container(
//       height: h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         image: const DecorationImage(
//           image: AssetImage('assets/banners/banner1.jpg'),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
//
//   Widget _featuredProducts(BuildContext context, UserHomeController c) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//
//         int crossAxis = constraints.maxWidth < 600 ? 2 : 3;
//
//         return GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: c.products.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: crossAxis,
//             childAspectRatio: 0.60,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//           ),
//
//           itemBuilder: (context, index) {
//             final p = c.products[index];
//
//             return GestureDetector(
//               onTap: () => Get.to(() => ProductDetailView(product: p)),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//
//                     AspectRatio(
//                       aspectRatio: 1,
//                       child: ClipRRect(
//                         borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                         child: Container(
//                           color: Colors.grey.shade200,
//                           child: FittedBox(
//                             fit: BoxFit.cover,
//                             child: Image.asset(p.imageUrl),
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 6,
//                           vertical: 8
//                       ),
//
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           Text(
//                             p.name,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: MediaQuery.of(context).size.width * 0.035,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//
//                           const SizedBox(height: 4),
//
//                           Text(
//                             "Rs. ${p.price}",
//                             style: const TextStyle(
//                               color: AppTheme.primary,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//
//   TextStyle get _sectionTitle =>
//       const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
// }
