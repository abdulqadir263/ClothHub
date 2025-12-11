import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/themes/app_theme.dart';
import '../add_product_viewmodel.dart';
import '../widgets/styled_text_field.dart';
import '../widgets/image_picker_box.dart';

/// Add Product Tab - Form to add new products
class AddProductTabView extends StatefulWidget {
  const AddProductTabView({super.key});

  @override
  State<AddProductTabView> createState() => _AddProductTabViewState();
}

class _AddProductTabViewState extends State<AddProductTabView> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<AddProductViewModel>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Add New Product',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Fill in the product details below',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),

          // Image picker
          Obx(() => ImagePickerBox(
                selectedImage: viewModel.selectedImage.value,
                onTap: () => viewModel.pickImage(),
              )),
          const SizedBox(height: 20),

          // Product name field
          StyledTextField(
            controller: nameController,
            label: 'Product Name',
            hint: 'Enter product name',
            icon: Icons.shopping_bag_outlined,
            onChanged: (value) => viewModel.productName.value = value,
          ),
          const SizedBox(height: 16),

          // Description field
          StyledTextField(
            controller: descriptionController,
            label: 'Description',
            hint: 'Enter product description',
            icon: Icons.description_outlined,
            maxLines: 3,
            onChanged: (value) => viewModel.productDescription.value = value,
          ),
          const SizedBox(height: 16),

          // Price field
          StyledTextField(
            controller: priceController,
            label: 'Price (Rs.)',
            hint: 'Enter price',
            icon: Icons.attach_money,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              viewModel.productPrice.value = double.tryParse(value) ?? 0.0;
            },
          ),
          const SizedBox(height: 16),

          // Category dropdown
          _buildCategoryDropdown(viewModel),
          const SizedBox(height: 30),

          // Add product button
          _buildAddButton(viewModel),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCategoryDropdown(AddProductViewModel viewModel) {
    return Obx(() => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: viewModel.productCategory.value,
            decoration: InputDecoration(
              labelText: 'Category',
              prefixIcon: const Icon(Icons.category_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            items: const [
              DropdownMenuItem(value: 'Male', child: Text('Male')),
              DropdownMenuItem(value: 'Female', child: Text('Female')),
            ],
            onChanged: (value) {
              if (value != null) viewModel.productCategory.value = value;
            },
          ),
        ));
  }

  Widget _buildAddButton(AddProductViewModel viewModel) {
    return Obx(() => SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: viewModel.isLoading.value
                ? null
                : () {
                    viewModel.addProduct();
                    nameController.clear();
                    descriptionController.clear();
                    priceController.clear();
                  },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: viewModel.isLoading.value
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'ADD PRODUCT',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
          ),
        ));
  }
}

