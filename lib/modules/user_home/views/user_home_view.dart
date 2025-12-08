import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_theme.dart';
import '../user_home_viewmodel.dart';
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
          Obx(() => Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => Get.toNamed('/cart'),
              ),
              if (cartViewModel.itemCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${cartViewModel.itemCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
            ],
          )),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              viewModel.logout();
              Get.offAllNamed(AppRoutes.login);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              final user = viewModel.currentUser.value;
              final userEmail = user?.email ?? 'User';
              return Text(
                'Hello, $userEmail!',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),

            const SizedBox(height: 8),

            Text(
              'What would you like to shop today?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: _buildCategoryCard(
                    'Male',
                    Icons.man,
                    Colors.blue,
                    () => Get.toNamed('/product-list', arguments: 'Male'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildCategoryCard(
                    'Female',
                    Icons.woman,
                    Colors.pink,
                    () => Get.toNamed('/product-list', arguments: 'Female'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16),

            _buildActionTile(
              'Browse All Products',
              Icons.shopping_bag_outlined,
              () => Get.toNamed('/product-list'),
            ),

            _buildActionTile(
              'My Cart',
              Icons.shopping_cart_outlined,
              () => Get.toNamed('/cart'),
            ),

            _buildActionTile(
              'My Orders',
              Icons.receipt_long_outlined,
              () => Get.toNamed('/orders'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(String title, IconData icon, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primary),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
