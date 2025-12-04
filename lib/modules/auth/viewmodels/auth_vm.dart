import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  var isLoading = false.obs;
  Rxn<User> currentUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    // Listen to auth state changes
    currentUser.bindStream(_auth.authStateChanges());
  }

  // Login with email and password
  Future<void> login(String email, String password) async {
    if (!email.contains("@")) {
      Get.snackbar("Error", "Enter valid Email");
      return;
    }
    if (password.length < 6) {
      Get.snackbar("Error", "Password must be of 6 characters");
      return;
    }

    isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Login successful");
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Login Failed");
    } finally {
      isLoading.value = false;
    }
  }

  // Signup with email and password
  Future<void> signup(String email, String password, String confirmPassword) async {
    if (!email.contains("@")) {
      Get.snackbar("Error", "Enter valid Email");
      return;
    }
    if (password.length < 6) {
      Get.snackbar("Error", "Password must be of 6 characters");
      return;
    }
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords must match");
      return;
    }

    isLoading.value = true;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Account created successfully");
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "SignUp Failed");
    } finally {
      isLoading.value = false;
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    if (!email.contains("@")) {
      Get.snackbar("Error", "Enter valid Email");
      return;
    }

    isLoading.value = true;
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Reset Password", "An email has been sent to you at $email");
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Failed to send reset password email");
    } finally {
      isLoading.value = false;
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Navigate after successful login based on role
  void navigateAfterLogin(String role) {
    if (isUserLoggedIn()) {
      if (role == 'admin') {
        Get.offAllNamed('/admin-dashboard');
      } else {
        Get.offAllNamed('/user-home');
      }
    }
  }

  // Navigate after successful signup based on role
  void navigateAfterSignup(String role) {
    if (isUserLoggedIn()) {
      if (role == 'admin') {
        Get.offAllNamed('/admin-dashboard');
      } else {
        Get.offAllNamed('/user-home');
      }
    }
  }

  // Check if user is logged in
  bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }

  // Get current user
  User? getLoggedInUser() {
    return _auth.currentUser;
  }
}
