import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../admin_products_viewmodel.dart';
import '../widgets/product_card.dart';
import 'product_detail_view.dart';

/// Admin Products Tab - Displays all products in a grid
class AdminProductsTabView extends StatelessWidget {
  const AdminProductsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<AdminProductsViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with title and refresh button
        _buildHeader(viewModel),

        // Products grid
        Expanded(child: _buildProductsGrid(context, viewModel)),
      ],
    );
  }

  /// Builds the header section
  Widget _buildHeader(AdminProductsViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'All Products',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () => viewModel.fetchAllProducts(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }

  /// Builds the products grid or empty/loading state
  Widget _buildProductsGrid(BuildContext context, AdminProductsViewModel viewModel) {
    return Obx(() {
      // Loading state
      if (viewModel.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      // Empty state
      if (viewModel.products.isEmpty) {
        return _buildEmptyState();
      }

      // Products grid
      return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: viewModel.products.length,
        itemBuilder: (context, index) {
          final product = viewModel.products[index];
          return ProductCard(
            product: product,
            onTap: () => Get.to(() => ProductDetailView(product: product)),
          );
        },
      );
    });
  }

  /// Builds empty state widget
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No products yet',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

