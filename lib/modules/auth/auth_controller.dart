import 'package:get/get.dart';
import '../../app/services/auth_navigation_service.dart';

class AuthController extends GetxController {

  final AuthNavigationService _navigationService = Get.find<AuthNavigationService>();

  var isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {

    await Future.delayed(const Duration(milliseconds: 500));

    await _navigationService.navigateBasedOnAuthState();

    isLoading.value = false;
  }
}
