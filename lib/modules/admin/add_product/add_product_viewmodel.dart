import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repositories/product_repository.dart';

class AddProductViewModel extends GetxController {
  final ProductRepository _productRepo = ProductRepository();
  final ImagePicker _picker = ImagePicker();

  var isLoading = false.obs;
  var selectedImage = Rxn<File>();
  var productName = ''.obs;
  var productDescription = ''.obs;
  var productPrice = 0.0.obs;
  var productCategory = 'Male'.obs;

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  Future<void> addProduct() async {
    if (productName.value.isEmpty) {
      Get.snackbar('Error', 'Please enter product name');
      return;
    }
    if (productDescription.value.isEmpty) {
      Get.snackbar('Error', 'Please enter product description');
      return;
    }
    if (productPrice.value <= 0) {
      Get.snackbar('Error', 'Please enter valid price');
      return;
    }
    if (selectedImage.value == null) {
      Get.snackbar('Error', 'Please select an image');
      return;
    }

    isLoading.value = true;

    try {
      final imageUrl = await _productRepo.uploadImageToCloudinary(
        selectedImage.value!,
      );

      if (imageUrl.isEmpty) {
        Get.snackbar('Error', 'Failed to upload image');
        return;
      }

      final product = ProductModel(
        id: '',
        name: productName.value,
        description: productDescription.value,
        price: productPrice.value,
        category: productCategory.value,
        imageUrl: imageUrl,
        createdAt: DateTime.now(),
      );

      await _productRepo.addProduct(product);
      Get.snackbar('Success', 'Product added successfully');
      clearForm();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add product');
    } finally {
      isLoading.value = false;
    }
  }

  void clearForm() {
    productName.value = '';
    productDescription.value = '';
    productPrice.value = 0.0;
    productCategory.value = 'Male';
    selectedImage.value = null;
  }
}

