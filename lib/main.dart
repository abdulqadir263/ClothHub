import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/themes/app_theme.dart';

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

      // Register global auth controller
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController(MockRepository()), permanent: true);
      }),

      initialRoute: AppRoutes.roleSelection,
      getPages: AppPages.pages,
    );
  }
}
