import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../viewmodels/signup_viewmodel.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final SignupViewModel viewModel = Get.find<SignupViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTheme.spacerLarge(),
            AppTheme.spacerMedium(),
            Icon(Icons.person, size: 80, color: AppTheme.primary),
            AppTheme.spacerMedium(),
            const Text("Sign Up", style: AppTheme.headingText),
            AppTheme.spacerLarge(),
            AppTheme.spacerMedium(),
            AppTheme.inputField(
              controller: emailController,
              hint: "Enter your email",
              label: "Email",
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            AppTheme.spacerMedium(),
            AppTheme.inputField(
              controller: passwordController,
              hint: "Enter your password",
              label: "Password",
              icon: Icons.lock,
              obscureText: obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => obscurePassword = !obscurePassword),
              ),
            ),
            AppTheme.spacerMedium(),
            AppTheme.inputField(
              controller: confirmPasswordController,
              hint: "Confirm your password",
              label: "Confirm Password",
              icon: Icons.lock,
              obscureText: obscureConfirmPassword,
              suffixIcon: IconButton(
                icon: Icon(obscureConfirmPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => obscureConfirmPassword = !obscureConfirmPassword),
              ),
            ),
            AppTheme.spacerLarge(),
            Obx(() => AppTheme.primaryButton(
              text: "SIGN UP",
              onPressed: () => viewModel.signup(
                emailController.text,
                passwordController.text,
                confirmPasswordController.text,
              ),
              isLoading: viewModel.isLoading.value,
            )),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Already have an account? Login", style: AppTheme.bodyText),
            ),
          ],
        ),
      ),
    );
  }
}
