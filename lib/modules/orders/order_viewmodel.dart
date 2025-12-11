import 'package:get/get.dart';
import '../../data/models/order_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/order_repository.dart';

class OrderViewModel extends GetxController {
  final OrderRepository orderRepo = Get.find<OrderRepository>();
  final AuthRepository authRepo = Get.find<AuthRepository>();

  var orders = <OrderModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserOrders();
  }

  Future<void> fetchUserOrders() async {
    final currentUser = authRepo.currentUser;
    if (currentUser == null) return;

    isLoading.value = true;
    try {
      orders.value = await orderRepo.getOrdersByUser(currentUser.uid);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load orders');
    } finally {
      isLoading.value = false;
    }
  }
}
