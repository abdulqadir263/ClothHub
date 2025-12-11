import 'package:flutter/material.dart';
import '../../../../app/themes/app_theme.dart';
import '../../../../data/models/product_model.dart';

/// Product card widget for admin products grid
class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onLongPress;

  const ProductCard({
    super.key,
    required this.product,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Card(
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              flex: 3,
              child: _buildProductImage(),
            ),
            // Product Details
            Expanded(
              flex: 2,
              child: _buildProductDetails(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Stack(
      children: [
        ClipRRect(
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
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.more_vert, size: 18, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }

  Widget _buildProductDetails() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Name
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),

          // Product Price
          Text(
            'Rs. ${product.price.toStringAsFixed(0)}',
            style: TextStyle(
              color: AppTheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const Spacer(),

          // Category Badge & Hint
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryBadge(),
              Text(
                'Hold for options',
                style: TextStyle(fontSize: 8, color: Colors.grey[500]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBadge() {
    final isMale = product.category == 'Male';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isMale ? Colors.blue.withOpacity(0.1) : Colors.pink.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
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
