import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../../../app/routes/app_routes.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // No back button
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Icon(Icons.check_circle,
                  color: Colors.green,
                  size: 80
              ),

              const SizedBox(height: 20),

              const Text(
                'Your order has been placed successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.userHome);
                  },
                  child: const Text('Go to Home', style:TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.orderHistory);
                  },
                  child: const Text('View My Orders'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
