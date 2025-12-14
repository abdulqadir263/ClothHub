import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/themes/app_theme.dart';
import '../../../../data/models/product_model.dart';
import '../admin_products_viewmodel.dart';
import 'edit_product_view.dart';

/// Product Detail View - Shows complete product information with edit/delete options
class ProductDetailView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<AdminProductsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProductImage(),
            _buildProductInfo(),
            _buildActionButtons(context, viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return SizedBox(
      height: 300,
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image_not_supported, size: 60, color: Colors.grey[400]),
              const SizedBox(height: 8),
              Text('Image not available', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text('Rs. ${product.price.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.primary)),
          const SizedBox(height: 20),
          _buildCategoryBadge(),
          const SizedBox(height: 24),
          _buildInfoSection('Description', product.description),
          const SizedBox(height: 20),
          _buildInfoSection('Product ID', product.id),
          const SizedBox(height: 20),
          _buildInfoSection('Added On', _formatDate(product.createdAt)),
        ],
      ),
    );
  }

  Widget _buildCategoryBadge() {
    final isMale = product.category == 'Male';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: (isMale ? Colors.blue : Colors.pink).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: (isMale ? Colors.blue : Colors.pink).withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isMale ? Icons.male : Icons.female,
              color: isMale ? Colors.blue[700] : Colors.pink[700], size: 20),
          const SizedBox(width: 8),
          Text(product.category,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isMale ? Colors.blue[700] : Colors.pink[700])),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[600])),
        const SizedBox(height: 8),
        Text(content, style: const TextStyle(fontSize: 16, height: 1.5)),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, AdminProductsViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () => Get.to(() => EditProductView(product: product)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.edit),
              label: const Text('Edit Product', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton.icon(
              onPressed: () => _showDeleteConfirmation(context, viewModel),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red, width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.delete),
              label: const Text('Delete Product', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, AdminProductsViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Delete Product'),
        content: Text('Are you sure you want to delete "${product.name}"? This action cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Get.back();
              viewModel.deleteProduct(product.id);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}

