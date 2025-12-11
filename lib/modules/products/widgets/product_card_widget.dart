import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../../../data/models/product_model.dart';

/// Product card widget for product grids
class ProductCardWidget extends StatelessWidget {
  final ProductModel product;

  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/product-detail', arguments: product),
      child: Card(
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Expanded(flex: 3, child: _buildProductImage()),

            // Product details
            Expanded(flex: 2, child: _buildProductDetails()),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Image.network(
        product.imageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200],
            child: const Center(
              child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductDetails() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Product name
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 2),

          // Price
          Text(
            'Rs. ${product.price.toStringAsFixed(0)}',
            style: TextStyle(
              color: AppTheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),

          // Category badge
          _buildCategoryBadge(),
        ],
      ),
    );
  }

  Widget _buildCategoryBadge() {
    final isMale = product.category == 'Male';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isMale ? Colors.blue.withOpacity(0.1) : Colors.pink.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        product.category,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: isMale ? Colors.blue[700] : Colors.pink[700],
        ),
      ),
    );
  }
}
