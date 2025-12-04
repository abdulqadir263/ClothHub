// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
// import '../viewmodels/admin_controller.dart';
//
// class AddProductView extends StatelessWidget {
//   const AddProductView({super.key});
//
//   @override
//   Widget build(BuildContext context)
//   {
//     final AdminController c = Get.find<AdminController>();
//     final nameC = TextEditingController();
//     final priceC = TextEditingController();
//     final descC = TextEditingController();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Product'),
//         centerTitle: true,
//         backgroundColor: AppTheme.primary,
//         foregroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//                 controller: nameC,
//                 decoration: const InputDecoration(
//                     labelText: 'Product Name'
//                 )
//             ),
//
//             const SizedBox(height: 10),
//
//             TextField(
//                 controller: priceC,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                     labelText: 'Price'
//                 )
//             ),
//
//             const SizedBox(height: 10),
//
//             TextField(
//                 controller: descC,
//                 decoration: const InputDecoration(
//                     labelText: 'Description'
//                 )
//             ),
//
//             const Spacer(),
//
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: ()
//                 {
//                   if (nameC.text.isEmpty || priceC.text.isEmpty)
//                   {
//                     Get.snackbar('Missing Fields', 'Please enter all details');
//                     return;
//                   }
//                   c.addProduct(nameC.text, double.parse(priceC.text), descC.text);
//                   Get.back();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white
//                 ),
//                 child: const Text('Add Product'),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
