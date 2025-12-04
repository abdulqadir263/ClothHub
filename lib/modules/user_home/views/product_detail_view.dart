// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
// import '../../../data/models/product_model.dart';
// import '../../cart/viewmodels/cart_controller.dart';
//
// class ProductDetailView extends StatelessWidget {
//
//   final ProductModel product;
//   const ProductDetailView({super.key, required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//
//     double imgHeight = MediaQuery.of(context).size.height * 0.33;
//
//     final CartController cartController =
//     Get.isRegistered<CartController>()
//         ? Get.find<CartController>()
//         : Get.put(CartController());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.name),
//         backgroundColor: AppTheme.primary,
//         foregroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//
//       body: Column(
//         children: [
//
//           SizedBox(
//
//             height: imgHeight,
//             width: double.infinity,
//
//             child: ClipRRect(
//               borderRadius: const BorderRadius.vertical(
//                 bottom: Radius.circular(8),
//               ),
//
//               child: FittedBox(
//                 fit: BoxFit.contain,
//                 child: Image.asset(product.imageUrl),
//               ),
//
//             ),
//
//           ),
//
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   Text(
//                     product.name,
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   const SizedBox(height: 8),
//
//                   Text(
//                     "Rs. ${product.price}",
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: AppTheme.primary,
//                     ),
//                   ),
//
//                   const SizedBox(height: 12),
//
//                   Text(
//                     product.description ?? "High quality fabric.",
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//
//                   const Spacer(),
//
//                   Obx(() {
//                     final inCart = cartController.isInCart(product);
//
//                     return SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: inCart
//                             ? null
//                             : () => cartController.addToCart(product),
//                         child: Text(inCart ? "Added" : "Add to Cart", style: TextStyle(
//                           color: Colors.white
//                         ),),
//                       ),
//                     );
//                   }),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
