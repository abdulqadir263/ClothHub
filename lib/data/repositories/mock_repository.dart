import '../models/user_model.dart';

class MockRepository {
  // Mock user database
  final List<UserModel> _users = [
    UserModel(
      id: '1',
      name: 'John Doe',
      email: 'user@gmail.com',
      isAdmin: false,
    ),
  ];

  Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Find user by email
    try {
      final user = _users.firstWhere(
        (u) => u.email.toLowerCase() == email.toLowerCase(),
      );
      return user;
    } catch (e) {
      // User not found, return null for invalid credentials
      return null;
    }
  }

  Future<UserModel?> signup(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final newUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      isAdmin: false,
    );
    
    _users.add(newUser);
    return newUser;
  }

  Future<bool> sendPasswordReset(String email) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}
