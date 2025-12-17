import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/themes/app_theme.dart';
import 'app/services/auth_navigation_service.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/user_repository.dart';
import 'data/repositories/product_repository.dart';
import 'data/repositories/order_repository.dart';
import 'data/repositories/cart_repository.dart';
import 'modules/cart/cart_viewmodel.dart';
import 'modules/products/product_list_viewmodel.dart';
import 'modules/orders/order_viewmodel.dart';
import 'modules/admin/add_product/add_product_viewmodel.dart';
import 'modules/admin/admin_products/admin_products_viewmodel.dart';
import 'modules/admin/admin_orders/admin_order_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initDependencies();

  runApp(const ClothHubApp());
}

void initDependencies() {
  Get.lazyPut(() => AuthRepository(), fenix: true);
  Get.lazyPut(() => UserRepository(), fenix: true);
  Get.lazyPut(() => ProductRepository(), fenix: true);
  Get.lazyPut(() => OrderRepository(), fenix: true);
  Get.lazyPut(() => CartRepository(), fenix: true);

  Get.lazyPut(() => AuthNavigationService(
    Get.find<AuthRepository>(),
    Get.find<UserRepository>(),
  ), fenix: true);

  Get.put(CartViewModel(), permanent: true);
  Get.lazyPut(() => ProductListViewModel(), fenix: true);
  Get.lazyPut(() => OrderViewModel(), fenix: true);
  Get.lazyPut(() => AddProductViewModel(), fenix: true);
  Get.lazyPut(() => AdminProductsViewModel(), fenix: true);
  Get.lazyPut(() => AdminOrderViewModel(), fenix: true);
}

class ClothHubApp extends StatelessWidget {
  const ClothHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ClothHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
