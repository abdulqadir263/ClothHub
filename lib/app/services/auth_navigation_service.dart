import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/user_repository.dart';

class AuthNavigationService {

  final AuthRepository _authRepo;
  final UserRepository _userRepo;

  AuthNavigationService(this._authRepo, this._userRepo);

  Future<void> navigateBasedOnAuthState() async {
    final user = _authRepo.currentUser;

    if (user == null) {
      Get.offAllNamed(AppRoutes.login);
      return;
    }

    await _navigateBasedOnUser(user);
  }

  Future<void> navigateBasedOnUser(User user) async {
    await _navigateBasedOnUser(user);
  }

  Future<void> navigateBasedOnEmail(String email) async {
    final user = _authRepo.currentUser;
    if (user != null) {
      await _navigateBasedOnUser(user);
    }
  }

  Future<void> _navigateBasedOnUser(User user) async {
    final email = user.email ?? '';

    if (_authRepo.isAdminEmail(email)) {
      Get.offAllNamed(AppRoutes.adminDashboard);
    }
    else {
      final profileComplete = await _userRepo.checkProfileCompletion(user.uid);

      if (profileComplete) {
        Get.offAllNamed(AppRoutes.userHome);
      }
      else {
        Get.offAllNamed(AppRoutes.profile);
      }
    }
  }
}

