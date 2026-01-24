import 'package:get/get.dart';

import 'app_routes.dart';

import '../../modules/auth/views/splash_view.dart';
import '../../modules/auth/views/login_view.dart';
import '../../modules/auth/views/signup_view.dart';
import '../../modules/auth/views/forgot_password_view.dart';
import '../../modules/auth/bindings/login_binding.dart';
import '../../modules/auth/bindings/signup_binding.dart';
import '../../modules/auth/bindings/forgot_password_binding.dart';

import '../../modules/profile/views/profile_view.dart';
import '../../modules/profile/profile_binding.dart';

import '../../modules/user_home/views/user_home_view.dart';
import '../../modules/user_home/user_home_binding.dart';

import '../../modules/admin/views/admin_dashboard_view.dart';
import '../../modules/admin/admin_binding.dart';

import '../../modules/admin/add_product/views/add_product_view.dart';
import '../../modules/admin/add_product/add_product_binding.dart';

import '../../modules/admin/admin_orders/views/admin_order_view.dart';
import '../../modules/admin/admin_orders/admin_order_binding.dart';

import '../../modules/products/views/product_list_view.dart';
import '../../modules/products/product_list_binding.dart';

import '../../modules/products/views/product_detail_view.dart';
import '../../modules/products/product_detail_binding.dart';

import '../../modules/cart/views/cart_view.dart';
import '../../modules/cart/views/checkout_view.dart';
import '../../modules/cart/cart_binding.dart';

import '../../modules/orders/views/order_list_view.dart';
import '../../modules/orders/order_binding.dart';

class AppPages {

  static final pages = [

    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),

    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.userHome,
      page: () => const UserHomeView(),
      binding: UserHomeBinding(),
    ),

    GetPage(
      name: AppRoutes.adminDashboard,
      page: () => const AdminDashboardView(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: AppRoutes.addProduct,
      page: () => const AddProductView(),
      binding: AddProductBinding(),
    ),

    GetPage(
      name: AppRoutes.productList,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
    ),

    GetPage(
      name: AppRoutes.productDetail,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),

    GetPage(
      name: AppRoutes.cart,
      page: () => const CartView(),
      binding: CartBinding(),
    ),

    GetPage(
      name: AppRoutes.checkout,
      page: () => const CheckoutView(),
      binding: CartBinding(),
    ),

    GetPage(
      name: AppRoutes.orders,
      page: () => const OrderListView(),
      binding: OrderBinding(),
    ),

    GetPage(
      name: AppRoutes.adminOrders,
      page: () => const AdminOrderView(),
      binding: AdminOrderBinding(),
    ),

  ];
}
