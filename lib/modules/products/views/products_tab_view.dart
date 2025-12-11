import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../product_list_viewmodel.dart';
import '../widgets/category_card.dart';
import '../widgets/product_card_widget.dart';

/// Products Tab - Shows product categories and product grid
class ProductsTabView extends StatelessWidget {
  const ProductsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<ProductListViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category filters
        _buildCategoryFilters(viewModel),

        // Products grid
        Expanded(child: _buildProductsGrid(viewModel)),
      ],
    );
  }

  /// Builds category filter section
  Widget _buildCategoryFilters(ProductListViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shop by Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CategoryCard(
                  title: 'Male',
                  icon: Icons.man,
                  color: Colors.blue,
                  viewModel: viewModel,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CategoryCard(
                  title: 'Female',
                  icon: Icons.woman,
                  color: Colors.pink,
                  viewModel: viewModel,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CategoryCard(
                  title: 'All',
                  icon: Icons.apps,
                  color: Colors.purple,
                  viewModel: viewModel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds products grid or empty/loading state
  Widget _buildProductsGrid(ProductListViewModel viewModel) {
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
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: viewModel.products.length,
        itemBuilder: (context, index) {
          return ProductCardWidget(product: viewModel.products[index]);
        },
      );
    });
  }

  /// Empty state widget
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No products found',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

