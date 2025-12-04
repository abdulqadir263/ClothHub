import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../viewmodels/auth_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController c = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.primary,
        elevation: 0,
        title: const Text('Forgot Password'),
      ),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Reset Password',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                'Enter your account email and we will send a reset link.',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: c.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => c.sendPasswordReset(c.emailController.text),
                  child: const Text('Send reset link', style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),

              const SizedBox(height: 12),

              TextButton(
                onPressed: () => Get.back(),
                child: const Text('Back to Login'),
              ),
            ],
          ),
        )

    );
  }
}
