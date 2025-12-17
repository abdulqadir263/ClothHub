import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../viewmodels/forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final ForgotPasswordViewModel viewModel = Get.find<ForgotPasswordViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.lock_reset, size: 80, color: AppTheme.primary),
            AppTheme.spacerMedium(),
            const Text("Reset Password", style: AppTheme.headingText),
            AppTheme.spacerSmall(),
            Text(
              "Enter your email address to get a link to reset your password.",
              textAlign: TextAlign.center,
              style: AppTheme.captionText,
            ),
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
            Obx(() => AppTheme.primaryButton(
              text: "SEND RESET LINK",
              onPressed: () => viewModel.resetPassword(emailController.text),
              isLoading: viewModel.isLoading.value,
            )),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Back to Login", style: AppTheme.bodyText),
            ),

          ],
        ),
      ),
      ),
    );
  }
}
