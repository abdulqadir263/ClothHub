import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order_model.dart';

class OrderRepository {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createOrder(OrderModel order) async
  {
    await _firestore.collection('orders').add(order.toMap());
  }

  Stream<List<OrderModel>> getOrdersByUser(String userId)
  {
    return _firestore.collection('orders').where('userId', isEqualTo: userId).snapshots().map((snapshot)
    {
      final orders = snapshot.docs.map((doc) => OrderModel.fromMap(doc.data(), doc.id)).toList();
      orders.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      return orders;
    });
  }

  Stream<List<OrderModel>> getAllOrders()
  {
    return _firestore.collection('orders').orderBy('timestamp', descending: true).snapshots().map((snapshot)
    {
      return snapshot.docs.map((doc) => OrderModel.fromMap(doc.data(), doc.id)).toList();
    });
  }

  Future<void> updateOrderStatus(String orderId, String status) async
  {
    await _firestore.collection('orders').doc(orderId).update({
      'status': status,
    });
  }
}
