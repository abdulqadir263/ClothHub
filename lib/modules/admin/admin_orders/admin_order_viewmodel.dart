import 'package:get/get.dart';
import '../../../data/models/order_model.dart';
import '../../../data/repositories/order_repository.dart';

class AdminOrderViewModel extends GetxController {
  final OrderRepository _orderRepo = OrderRepository();

  var orders = <OrderModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllOrders();
  }

  Future<void> fetchAllOrders() async {
    isLoading.value = true;
    try {
      orders.value = await _orderRepo.getAllOrders();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load orders');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateStatus(String orderId, String newStatus) async {
    try {
      await _orderRepo.updateOrderStatus(orderId, newStatus);
      fetchAllOrders();
      Get.snackbar('Success', 'Order status updated');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update status');
    }
  }
}

