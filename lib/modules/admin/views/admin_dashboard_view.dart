import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_theme.dart';
import '../admin_viewmodel.dart';
import '../add_product/views/add_product_tab_view.dart';
import '../admin_products/views/admin_products_tab_view.dart';
import '../admin_orders/views/admin_orders_tab_view.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminViewModel viewModel = Get.find<AdminViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
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
            return const AddProductTabView();
          case 1:
            return const AdminProductsTabView();
          case 2:
            return const AdminOrdersTabView();
          default:
            return const AddProductTabView();
        }
      }),
      bottomNavigationBar: Obx(() => NavigationBar(
        selectedIndex: viewModel.currentTabIndex.value,
        onDestinationSelected: (index) {
          viewModel.changeTab(index);
        },
        backgroundColor: Colors.white,
        indicatorColor: AppTheme.primary.withOpacity(0.2),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.add_box_outlined),
            selectedIcon: Icon(Icons.add_box, color: AppTheme.primary),
            label: 'Add Product',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2, color: AppTheme.primary),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long, color: AppTheme.primary),
            label: 'Orders',
          ),
        ],
      )),
    );
  }
}

