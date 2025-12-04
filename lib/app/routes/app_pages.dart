import 'package:get/get.dart';


import 'app_routes.dart';

// ---------- AUTH ----------
import '../../modules/auth/views/role_selection_view.dart';
import '../../modules/auth/views/login_view.dart';
import '../../modules/auth/views/signup_view.dart';
import '../../modules/auth/views/forgot_password_view.dart';
import '../../modules/auth/auth_binding.dart';

// ---------- USER ----------
import '../../modules/user_home/views/user_home_view.dart';
import '../../modules/user_home/views/profile_view.dart';
import '../../modules/user_home/views/category_view.dart';
import '../../modules/user_home/views/product_list_view.dart';
import '../../modules/user_home/views/product_detail_view.dart';
import '../../modules/user_home/user_home_binding.dart';

// ---------- CART ----------
import '../../modules/cart/views/cart_view.dart';
import '../../modules/cart/views/checkout_view.dart';
import '../../modules/cart/views/order_success_view.dart';
import '../../modules/cart/views/order_history_view.dart';
import '../../modules/cart/cart_binding.dart';

// ---------- ADMIN ----------
import '../../modules/admin/views/admin_dashboard_view.dart';
import '../../modules/admin/views/manage_products_view.dart';
import '../../modules/admin/views/add_product_view.dart';
import '../../modules/admin/views/manage_orders_view.dart';
import '../../modules/admin/views/order_detail_view.dart';
import '../../modules/admin/views/users_list_view.dart';
import '../../modules/admin/admin_binding.dart';

class AppPages {

  static final pages =
  [

    // ---------------- AUTH ----------------
    GetPage(
      name: AppRoutes.roleSelection,
      page: () => const RoleSelectionView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),

    // ---------------- USER ----------------
    GetPage(
      name: AppRoutes.userHome,
      page: () => const UserHomeView(),
      binding: UserHomeBinding(),
    ),

    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: UserHomeBinding(),
    ),

    GetPage(
      name: AppRoutes.category,
      page: () => const CategoryView(),
      binding: UserHomeBinding(),
    ),

    GetPage(
      name: AppRoutes.productList,
      page: ()
      {
        final category = Get.arguments as String;
        return ProductListView(category: category);
      },
      binding: UserHomeBinding(),
    ),

    GetPage(
      name: AppRoutes.productDetail,
      page: () {
        final product = Get.arguments;
        return ProductDetailView(product: product);
      },
      binding: UserHomeBinding(),
    ),

    // ---------------- CART ----------------
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
      name: AppRoutes.orderSuccess,
      page: () => const OrderSuccessView(),
      binding: CartBinding(),
    ),

    GetPage(
      name: AppRoutes.orderHistory,
      page: () => const OrderHistoryView(),
      binding: CartBinding(),
    ),

    // ---------------- ADMIN ----------------
    GetPage(
      name: AppRoutes.adminDashboard,
      page: () => const AdminDashboardView(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: AppRoutes.manageProducts,
      page: () => const ManageProductsView(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: AppRoutes.addProduct,
      page: () => const AddProductView(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: AppRoutes.manageOrders,
      page: () => const ManageOrdersView(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: AppRoutes.adminOrderDetail,
      page: ()
      {
        final index = Get.arguments as int;
        return AdminOrderDetailView(orderIndex: index);
      },
      binding: AdminBinding(),
    ),

    GetPage(
      name: AppRoutes.adminUsers,
      page: () => const UsersListView(),
      binding: AdminBinding(),
    ),

  ];
}
