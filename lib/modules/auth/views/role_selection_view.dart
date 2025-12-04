import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_theme.dart';

class RoleSelectionView extends StatelessWidget {
  const RoleSelectionView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              Text('Welcome to ClothHub',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primary)),

              const SizedBox(height: 8),

              Text(
                'Login or Sign up to continue',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),

              const SizedBox(height: 32),

              Expanded(
                child: Center(
                  child: _userCard(context),
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.login),
                  child: const Text("Already have an account? Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
          ),
        ],
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const Icon(Icons.person, size: 68),

          const SizedBox(height: 12),

          const Text('Customer', style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600
          )),

          const SizedBox(height: 8),

          const Text('Browse and place orders from the catalog',
              textAlign: TextAlign.center),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Get.toNamed(AppRoutes.login),
                child: const Text('Login', style: TextStyle(
                  color: Colors.white
                ),),
              ),

              const SizedBox(width: 12),

              OutlinedButton(
                onPressed: () => Get.toNamed(AppRoutes.signup),
                child: const Text('Sign up'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
