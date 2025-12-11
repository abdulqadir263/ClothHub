import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../data/repositories/auth_repository.dart';

class AdminViewModel extends GetxController {
  final AuthRepository authRepo = Get.find<AuthRepository>();

  var currentTabIndex = 0.obs;
  Rxn<User> currentUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    currentUser.bindStream(authRepo.authStateChanges);
  }

  void changeTab(int index) {
    currentTabIndex.value = index;
  }

  Future<void> logout() async {
    await authRepo.logout();
  }
}
