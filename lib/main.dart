import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/themes/app_theme.dart';

// Controllers
import 'modules/auth/viewmodels/auth_controller.dart';
import 'modules/cart/viewmodels/cart_controller.dart';

// Repository
import 'data/repositories/mock_repository.dart';

void main() {
  runApp(const ClothHubApp());
}

class ClothHubApp extends StatelessWidget {
  const ClothHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ClothHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      // Register ALL global controllers here
      initialBinding: BindingsBuilder(() {
        // Global Auth Controller
        Get.put(AuthController(MockRepository()), permanent: true);

        // Global Cart Controller (IMPORTANT FIX)
        Get.put(CartController(), permanent: true);
      }),

      initialRoute: AppRoutes.roleSelection,
      getPages: AppPages.pages,
    );
  }
}
