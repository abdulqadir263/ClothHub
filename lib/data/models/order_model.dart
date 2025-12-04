class OrderModel {
  final String id;
  final String customerName;
  final double totalAmount;
  final String status;
  final String date;
  final List<String>? products;

  OrderModel({
    required this.id,
    required this.customerName,
    required this.totalAmount,
    required this.status,
    required this.date,
    this.products,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'customerName': customerName,
    'totalAmount': totalAmount,
    'status': status,
    'date': date,
    'products': products,
  };

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json['id'],
    customerName: json['customerName'],
    totalAmount: (json['totalAmount'] as num).toDouble(),
    status: json['status'],
    date: json['date'],
    products:
    (json['products'] as List?)?.map((e) => e.toString()).toList() ?? [],
  );
}
