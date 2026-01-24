import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../app/themes/app_theme.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/repositories/product_repository.dart';
import '../../../../data/repositories/media_repository.dart';
import '../admin_products_viewmodel.dart';

class EditProductView extends StatefulWidget {
  final ProductModel product;
  const EditProductView({super.key, required this.product});
  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  final _productRepo = Get.find<ProductRepository>();
  final _mediaRepo = Get.find<MediaRepository>();
  final _picker = ImagePicker();
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late String category;
  File? selectedImage;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product.name);
    descriptionController = TextEditingController(text: widget.product.description);
    priceController = TextEditingController(text: widget.product.price.toString());
    category = widget.product.category;
  }

  @override
  void dispose() { nameController.dispose(); descriptionController.dispose(); priceController.dispose(); super.dispose(); }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) setState(() => selectedImage = File(image.path));
  }

  Future<void> updateProduct() async {
    if (nameController.text.isEmpty) { Get.snackbar('Error', 'Please enter product name'); return; }
    if (descriptionController.text.isEmpty) { Get.snackbar('Error', 'Please enter description'); return; }
    if (priceController.text.isEmpty) { Get.snackbar('Error', 'Please enter price'); return; }
    setState(() => isLoading = true);
    try {
      String imageUrl = widget.product.imageUrl;
      if (selectedImage != null) {
        final response = await _mediaRepo.uploadImage(selectedImage!.path);
        imageUrl = response.secureUrl ?? widget.product.imageUrl;
      }
      await _productRepo.updateProduct(widget.product.id, {
        'name': nameController.text, 'description': descriptionController.text,
        'price': double.parse(priceController.text), 'category': category, 'imageUrl': imageUrl,
      });
      Get.find<AdminProductsViewModel>().fetchAllProducts();
      Get.back();
      Get.snackbar('Success', 'Product updated');
    } catch (e) { Get.snackbar('Error', 'Failed to update product'); } finally { setState(() => isLoading = false); }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product'), centerTitle: true, backgroundColor: AppTheme.primary, foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildImagePicker(),
          const SizedBox(height: 20),
          _buildTextField(nameController, 'Product Name', Icons.shopping_bag_outlined),
          const SizedBox(height: 16),
          _buildTextField(descriptionController, 'Description', Icons.description_outlined, maxLines: 3),
          const SizedBox(height: 16),
          _buildTextField(priceController, 'Price (Rs.)', Icons.attach_money, keyboardType: TextInputType.number),
          const SizedBox(height: 16),
          _buildCategoryDropdown(),
          const SizedBox(height: 30),
          _buildUpdateButton(),
        ]),
      ),
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: pickImage,
      child: Container(
        height: 180, width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey[300]!)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: selectedImage != null ? Image.file(selectedImage!, fit: BoxFit.cover) : Stack(fit: StackFit.expand, children: [
            Image.network(widget.product.imageUrl, fit: BoxFit.cover, errorBuilder: (c, e, s) => const Center(child: Icon(Icons.image_not_supported, size: 50))),
            Container(color: Colors.black26, child: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.camera_alt, color: Colors.white, size: 36), SizedBox(height: 8), Text('Tap to change image', style: TextStyle(color: Colors.white)),
            ]))),
          ]),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return AppTheme.inputField(
      controller: controller,
      hint: label,
      label: label,
      icon: icon,
      maxLines: maxLines,
      keyboardType: keyboardType,
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
      child: DropdownButtonFormField<String>(
        value: category, decoration: InputDecoration(labelText: 'Category', prefixIcon: const Icon(Icons.category_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none), filled: true, fillColor: Colors.white),
        items: const [DropdownMenuItem(value: 'Male', child: Text('Male')), DropdownMenuItem(value: 'Female', child: Text('Female'))],
        onChanged: (value) { if (value != null) setState(() => category = value); },
      ),
    );
  }

  Widget _buildUpdateButton() {
    return AppTheme.primaryButton(
      text: 'UPDATE PRODUCT',
      onPressed: updateProduct,
      isLoading: isLoading,
    );
  }
}

