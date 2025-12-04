import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../../../app/routes/app_routes.dart';
import '../viewmodels/auth_controller.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
        title: const Text('Sign Up'),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              'Create Account',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Enter your details to register',
              style: TextStyle(
                  color: Colors.grey
              ),
            ),

            const SizedBox(height: 18),

            TextField(
              controller: c.nameController,
              decoration: const InputDecoration(
                  labelText: 'Full name'
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: c.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Email'
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: c.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Password'
              ),
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: c.signup,
                child: const Text('Create account',style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () => Get.offAllNamed(AppRoutes.login),
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
