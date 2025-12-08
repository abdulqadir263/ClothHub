import 'package:get/get.dart';
import '../../data/models/order_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/order_repository.dart';

class OrderViewModel extends GetxController {
  final OrderRepository _orderRepo = OrderRepository();
  final AuthRepository _authRepo = AuthRepository();

  var orders = <OrderModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserOrders();
  }

  Future<void> fetchUserOrders() async {
    final currentUser = _authRepo.currentUser;
    if (currentUser == null) return;

    isLoading.value = true;
    try {
      orders.value = await _orderRepo.getOrdersByUser(currentUser.uid);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load orders');
    } finally {
      isLoading.value = false;
    }
  }

  String getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return 'orange';
      case 'processing':
        return 'blue';
      case 'delivered':
        return 'green';
      case 'cancelled':
        return 'red';
      default:
        return 'grey';
    }
  }
}

