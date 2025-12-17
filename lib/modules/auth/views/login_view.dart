import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_theme.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final LoginViewModel viewModel = Get.find<LoginViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
            const Text("Login", style: AppTheme.headingText),
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
            Obx(() => AppTheme.primaryButton(
              text: "LOGIN",
              onPressed: () => viewModel.login(emailController.text, passwordController.text),
              isLoading: viewModel.isLoading.value,
            )),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.signup),
              child: const Text("Don't have an account? Sign Up", style: AppTheme.bodyText),
            ),
            AppTheme.spacerSmall(),
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
              child: const Text("Forgot Password?", style: AppTheme.bodyText),
            ),
          ],
        ),
      ),
    );
  }
}
