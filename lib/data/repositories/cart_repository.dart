import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cart_item_model.dart';

class CartRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CartItemModel>> fetchCart(String uid) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(uid)
        .collection('cart')
        .get();

    return snapshot.docs
        .map((doc) => CartItemModel.fromMap(doc.data()))
        .toList();
  }

  Future<void> addToCart(String uid, CartItemModel item) async {
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(item.productId)
        .set(item.toMap());
  }

  Future<void> removeFromCart(String uid, String productId) async {
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(productId)
        .delete();
  }

  Future<void> updateQuantity(String uid, String productId, int quantity) async {
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(productId)
        .update({'quantity': quantity});
  }

  Future<void> clearCart(String uid) async {
    final batch = _firestore.batch();
    final cartItems = await _firestore
        .collection('users')
        .doc(uid)
        .collection('cart')
        .get();

    for (var doc in cartItems.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  Future<int> getCartCount(String uid) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(uid)
        .collection('cart')
        .get();
    return snapshot.docs.length;
  }
}
