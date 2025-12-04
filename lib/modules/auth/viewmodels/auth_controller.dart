import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/mock_repository.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/utils/constants.dart';

class AuthController extends GetxController {

  final MockRepository repo;
  AuthController(this.repo);

  final Rxn<UserModel> currentUser = Rxn<UserModel>();
  final RxBool isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  Future<void> login() async
  {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty)
    {
      Get.snackbar('Validation', 'Please enter email and password',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value = true;
      final user = await repo.login(email, password);
      isLoading.value = false;
      if (user == null) {
        Get.snackbar('Login failed', 'Invalid credentials');
        return;
      }

      final isAdmin = AppConstants.adminEmails.contains(
          email.toLowerCase()) &&
          password == AppConstants.adminPassword;

      currentUser.value = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        isAdmin: isAdmin,
      );

      if (isAdmin)
      {
        Get.snackbar('Welcome Admin', 'Logged in as admin: ${user.email}');
        Get.offAllNamed(AppRoutes.adminDashboard);
      } else
      {
        Get.snackbar('Welcome', 'Logged in as ${user.email}');
        Get.offAllNamed(AppRoutes.userHome);
      }
    } catch (e)
    {
      isLoading.value = false;
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  Future<void> signup() async
  {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.length < 4)
    {
      Get.snackbar('Validation', 'Please fill all fields (password ≥4 chars)');
      return;
    }

    try {
      isLoading.value = true;
      final user = await repo.signup(name, email, password);
      isLoading.value = false;
      if (user == null) {
        Get.snackbar('Signup failed', 'Please check your inputs');
        return;
      }

      currentUser.value = user;
      Get.snackbar('Welcome', 'Account created');
      Get.offAllNamed(AppRoutes.userHome);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  Future<void> sendPasswordReset(String email) async
  {
    if (email.trim().isEmpty) {
      Get.snackbar('Validation', 'Please enter email');
      return;
    }
    isLoading.value = true;
    final ok = await repo.sendPasswordReset(email);
    isLoading.value = false;
    if (ok)
    {
      Get.snackbar('Success', 'Password reset link sent (mock)');
      Get.back();
    } else
    {
      Get.snackbar('Error', 'Failed to send reset');
    }
  }

  void logout() {
    currentUser.value = null;
    emailController.clear();
    passwordController.clear();
    nameController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
