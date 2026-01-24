import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(ProductModel product) async {
    await _firestore.collection('products').add(product.toMap());
  }

  Stream<List<ProductModel>> getAllProducts() {
    return _firestore.collection('products').orderBy('createdAt', descending: true).snapshots().map((snapshot)
    {
          return snapshot.docs.map((doc) => ProductModel.fromMap(doc.data(), doc.id)).toList();
        });
  }

  Stream<List<ProductModel>> getProductsByCategory(String category) {
    return _firestore.collection('products').where('category', isEqualTo: category).snapshots().map((snapshot)
    {
          return snapshot.docs.map((doc) => ProductModel.fromMap(doc.data(), doc.id)).toList();
        });
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

  Future<void> updateProduct(
    String productId,
    Map<String, dynamic> data,
  ) async
  {
    await _firestore.collection('products').doc(productId).update(data);
  }
}
