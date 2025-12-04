// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
// import '../viewmodels/user_home_controller.dart';
// import '../../cart/viewmodels/cart_controller.dart';
// import 'home_tab_view.dart';
// import 'category_view.dart';
// import '../../cart/views/cart_view.dart';
// import 'profile_view.dart';
//
// class UserHomeView extends StatelessWidget {
//   const UserHomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final UserHomeController c = Get.put(UserHomeController());
//
//     final CartController cartController =
//     Get.isRegistered<CartController>() ? Get.find<CartController>() : Get.put(CartController());
//
//     final tabs = [
//       const HomeTabView(),
//       const CategoryView(),
//       const CartView(),
//       const ProfileView(),
//     ];
//
//     return Obx(() => Scaffold(
//       body: SafeArea(child: tabs[c.selectedIndex.value]),
//
//       bottomNavigationBar: BottomNavigationBar(
//
//         currentIndex: c.selectedIndex.value,
//         onTap: c.onItemTapped,
//         selectedItemColor: AppTheme.primary,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//
//         items: [
//
//           const BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home'
//           ),
//
//           const BottomNavigationBarItem(
//               icon: Icon(Icons.category),
//               label: 'Categories'
//           ),
//
//           BottomNavigationBarItem(
//             icon: Obx(() {
//               final count = cartController.cartItems.length;
//               return Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   const Icon(Icons.shopping_cart),
//                   if (count > 0)
//
//                     Positioned(
//                       right: -6,
//                       top: -6,
//
//                       child: Container(
//                         padding: const EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                           color: Colors.red,
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                               color: Colors.white,
//                               width: 1.5
//                           ),
//                         ),
//
//                         constraints: const BoxConstraints(
//                             minWidth: 18,
//                             minHeight: 18
//                         ),
//
//                         child: Center(
//                           child: Text(
//                             count.toString(),
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 11
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               );
//             }),
//             label: 'Cart',
//           ),
//           const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     ));
//   }
// }
