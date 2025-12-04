import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_theme.dart';
import '../viewmodels/auth_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController c = Get.find();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.primary,
        title: const Text('Login'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 18),

            TextField(
              controller: c.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'abc@gmail.com',
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: c.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),

            const SizedBox(height: 14),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
                child: const Text('Forgot password?'),
              ),
            ),

            const SizedBox(height: 6),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: c.login,
                child: const Text('Login', style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.signup),
                  child: const Text('Sign up'),
                ),
              ],
            ),

            const SizedBox(height: 18),

            const Text(
              'Note: To login as admin, use an admin email and the admin password.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),

      ),
    );
  }
}
