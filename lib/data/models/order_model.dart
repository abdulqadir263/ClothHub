import 'cart_item_model.dart';

class OrderModel {
  final String orderId;
  final String userId;
  final List<CartItemModel> products;
  final double totalPrice;
  final DateTime timestamp;
  final String status;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.products,
    required this.totalPrice,
    required this.timestamp,
    this.status = 'pending',
  });

  factory OrderModel.fromMap(Map<String, dynamic> map, String docId) {
    List<CartItemModel> productsList = [];
    if (map['products'] != null) {
      productsList = (map['products'] as List)
          .map((item) => CartItemModel.fromMap(item))
          .toList();
    }

    return OrderModel(
      orderId: docId,
      userId: map['userId'] ?? '',
      products: productsList,
      totalPrice: (map['totalPrice'] ?? 0).toDouble(),
      timestamp: DateTime.tryParse(map['timestamp'] ?? '') ?? DateTime.now(),
      status: map['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'products': products.map((item) => item.toMap()).toList(),
      'totalPrice': totalPrice,
      'timestamp': timestamp.toIso8601String(),
      'status': status,
    };
  }
}

