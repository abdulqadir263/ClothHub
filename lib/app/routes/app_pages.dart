import 'package:get/get.dart';


import 'app_routes.dart';

// ---------- AUTH ----------
import '../../modules/auth/views/role_selection_view.dart';
import '../../modules/auth/views/login_view.dart';
import '../../modules/auth/views/signup_view.dart';
import '../../modules/auth/views/forget_password.dart';
import '../../modules/auth/auth_binding.dart';

// ---------- USER ----------
import '../../modules/user_home/views/user_home_view.dart';
import '../../modules/user_home/user_home_binding.dart';

// ---------- ADMIN ----------
import '../../modules/admin/views/admin_dashboard_view.dart';
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

    // ---------------- ADMIN ----------------
    GetPage(
      name: AppRoutes.adminDashboard,
      page: () => const AdminDashboardView(),
      binding: AdminBinding(),
    ),

  ];
}
