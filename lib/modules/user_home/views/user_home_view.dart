import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_theme.dart';
import '../../auth/viewmodels/auth_controller.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Home'),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.logout();
              Get.offAllNamed(AppRoutes.roleSelection);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                size: 100,
                color: AppTheme.primary.withOpacity(0.5),
              ),
              const SizedBox(height: 24),
              const Text(
                'Welcome to ClothHub',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Obx(() {
                final user = authController.currentUser.value;
                final userName = user?.name ?? 'User';
                return Text(
                  'Hello, $userName!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
