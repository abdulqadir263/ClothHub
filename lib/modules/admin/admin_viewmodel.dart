import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../data/repositories/auth_repository.dart';

class AdminViewModel extends GetxController {
  final AuthRepository _authRepo = AuthRepository();

  Rxn<User> currentUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    currentUser.bindStream(_authRepo.authStateChanges);
  }

  Future<void> logout() async {
    await _authRepo.logout();
  }
}
