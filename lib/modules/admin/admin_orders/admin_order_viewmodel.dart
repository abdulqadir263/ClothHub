import 'package:get/get.dart';
import '../../../data/models/order_model.dart';
import '../../../data/repositories/order_repository.dart';

class AdminOrderViewModel extends GetxController {

  final OrderRepository orderRepo = Get.find<OrderRepository>();

  var orders = <OrderModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _listenToOrders();
  }

  void _listenToOrders() {

    isLoading.value = true;

    final stream = orderRepo.getAllOrders();
    orders.bindStream(stream);
    stream.listen((_) => isLoading.value = false);

  }

  void fetchAllOrders() {
    _listenToOrders();
  }

  Future<void> updateStatus(String orderId, String newStatus) async {
    try
    {
      await orderRepo.updateOrderStatus(orderId, newStatus);
      Get.snackbar('Success', 'Order status updated');
    }
    catch (e) {
      Get.snackbar('Error', 'Failed to update status');
    }
  }
}
