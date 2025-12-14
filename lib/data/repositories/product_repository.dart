import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';
import '../services/cloudinary_service.dart';

class ProductRepository {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CloudinaryService _cloudinaryService = CloudinaryService();

  Future<String> uploadImageToCloudinary(File imageFile) async {
    return await _cloudinaryService.uploadImage(imageFile);
  }

  Future<void> addProduct(ProductModel product) async {
    await _firestore.collection('products').add(product.toMap());
  }

  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await _firestore
        .collection('products')
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => ProductModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final snapshot = await _firestore
        .collection('products')
        .where('category', isEqualTo: category)
        .get();
    return snapshot.docs
        .map((doc) => ProductModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<ProductModel?> getProductById(String productId) async {
    final doc = await _firestore.collection('products').doc(productId).get();
    if (doc.exists && doc.data() != null) {
      return ProductModel.fromMap(doc.data()!, doc.id);
    }
    return null;
  }

  Future<void> deleteProduct(String productId) async {
    await _firestore.collection('products').doc(productId).delete();
  }

  Future<void> updateProduct(String productId, Map<String, dynamic> data) async {
    await _firestore.collection('products').doc(productId).update(data);
  }
}
