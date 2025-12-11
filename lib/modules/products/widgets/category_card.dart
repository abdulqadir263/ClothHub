import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../product_list_viewmodel.dart';

/// Category filter card widget
class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final ProductListViewModel viewModel;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = viewModel.selectedCategory.value == title;
      return GestureDetector(
        onTap: () => viewModel.filterByCategory(title),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.2) : color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? color : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28, color: color),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
