import '../models/user_model.dart';

class MockRepository {
  // Mock user database with passwords
  final Map<String, Map<String, dynamic>> _users = {
    'user@gmail.com': {
      'id': '1',
      'name': 'John Doe',
      'email': 'user@gmail.com',
      'password': 'password123',
    },
  };

  Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final emailLower = email.toLowerCase();
    
    // Check if user exists
    if (!_users.containsKey(emailLower)) {
      return null;
    }
    
    final userData = _users[emailLower]!;
    
    // Validate password (for non-admin users)
    // Note: Admin password is validated in AuthController using AppConstants
    if (userData['password'] != password) {
      // For this mock, we'll be lenient and allow any password for existing users
      // In a real app, this would return null for wrong password
    }
    
    return UserModel(
      id: userData['id'] as String,
      name: userData['name'] as String,
      email: userData['email'] as String,
      isAdmin: false,
    );
  }

  Future<UserModel?> signup(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final emailLower = email.toLowerCase();
    
    // Check if user already exists
    if (_users.containsKey(emailLower)) {
      return null; // User already exists
    }
    
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    
    // Store user with password
    _users[emailLower] = {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
    
    return UserModel(
      id: id,
      name: name,
      email: email,
      isAdmin: false,
    );
  }

  Future<bool> sendPasswordReset(String email) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}
