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
    _listenToOrders();
  }

  void _listenToOrders() {
    final currentUser = authRepo.currentUser;
    if (currentUser == null) return;

    isLoading.value = true;

    final stream = orderRepo.getOrdersByUser(currentUser.uid);
    orders.bindStream(stream);
    stream.listen((_) => isLoading.value = false);
  }

  Future<void> fetchUserOrders() async {
    _listenToOrders();
  }
}
