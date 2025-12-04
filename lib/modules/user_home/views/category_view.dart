// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
// import '../viewmodels/user_home_controller.dart';
// import 'product_list_view.dart';
//
// class CategoryView extends StatelessWidget {
//   const CategoryView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final c = Get.find<UserHomeController>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Categories'),
//         centerTitle: true,
//         backgroundColor: AppTheme.primary,
//         foregroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//
//       body: ListView.builder(
//         itemCount: c.categories.length,
//         itemBuilder: (context, index) {
//           final category = c.categories[index];
//
//           return LayoutBuilder(
//             builder: (context, constraints) {
//               double imgSize = constraints.maxWidth * 0.14;
//
//               return Card(
//                 margin: const EdgeInsets.all(12),
//                 child: ListTile(
//                   leading: category.imageUrl != null
//                       ? ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       category.imageUrl!,
//                       width: imgSize,
//                       height: imgSize,
//                       fit: BoxFit.cover,
//                     ),
//                   )
//                       : const Icon(Icons.category, color: AppTheme.primary),
//                   title: Text(category.name),
//                   trailing: const Icon(Icons.arrow_forward_ios, size: 18),
//                   onTap: () => Get.to(() => ProductListView(category: category.name)),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
