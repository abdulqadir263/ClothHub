import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../../data/models/user_model.dart';

class UserHomeViewModel extends GetxController {
  final AuthRepository authRepo = Get.find<AuthRepository>();
  final UserRepository userRepo = Get.find<UserRepository>();

  var currentTabIndex = 0.obs;
  Rxn<User> currentUser = Rxn<User>();
  Rxn<UserModel> userProfile = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    currentUser.bindStream(authRepo.authStateChanges);
    loadUserProfile();
  }

  void changeTab(int index) {
    currentTabIndex.value = index;
  }

  Future<void> loadUserProfile() async {
    final user = authRepo.currentUser;
    if (user != null) {
      userProfile.value = await userRepo.getUserById(user.uid);
    }
  }

  Future<void> logout() async {
    await authRepo.logout();
  }
}
