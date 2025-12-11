import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_theme.dart';
import '../user_home_viewmodel.dart';
import '../../products/views/products_tab_view.dart';
import '../../cart/views/cart_tab_view.dart';
import '../../orders/views/orders_tab_view.dart';
import '../../cart/cart_viewmodel.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserHomeViewModel viewModel = Get.find<UserHomeViewModel>();
    final CartViewModel cartViewModel = Get.find<CartViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ClothHub'),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              viewModel.logout();
              Get.offAllNamed(AppRoutes.login);
            },
          ),
        ],
      ),
      body: Obx(() {
        switch (viewModel.currentTabIndex.value) {
          case 0:
            return const ProductsTabView();
          case 1:
            return const CartTabView();
          case 2:
            return const OrdersTabView();
          default:
            return const ProductsTabView();
        }
      }),
      bottomNavigationBar: Obx(() => NavigationBar(
        selectedIndex: viewModel.currentTabIndex.value,
        onDestinationSelected: (index) {
          viewModel.changeTab(index);
        },
        backgroundColor: Colors.white,
        indicatorColor: AppTheme.primary.withOpacity(0.2),
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            selectedIcon: Icon(Icons.storefront, color: AppTheme.primary),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: cartViewModel.itemCount > 0,
              label: Text(
                '${cartViewModel.itemCount}',
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            selectedIcon: Badge(
              isLabelVisible: cartViewModel.itemCount > 0,
              label: Text(
                '${cartViewModel.itemCount}',
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              child: const Icon(Icons.shopping_cart, color: AppTheme.primary),
            ),
            label: 'Cart',
          ),
          const NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long, color: AppTheme.primary),
            label: 'Orders',
          ),
        ],
      )),
    );
  }
}

