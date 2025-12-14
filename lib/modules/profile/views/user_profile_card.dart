import 'package:flutter/material.dart';
import '../../../app/themes/app_theme.dart';
import '../../../data/models/user_model.dart';

class UserProfileCard extends StatelessWidget {
  final UserModel user;

  const UserProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileRow(Icons.person, 'Full Name', user.fullName),
            const Divider(),
            _buildProfileRow(Icons.wc, 'Gender', user.gender),
            const Divider(),
            _buildProfileRow(Icons.cake, 'Age', user.age > 0 ? user.age.toString() : 'Not set'),
            const Divider(),
            _buildProfileRow(Icons.location_on, 'Address', user.address.isEmpty ? 'Not set' : user.address),
            const Divider(),
            _buildProfileRow(Icons.phone, 'Phone', user.phoneNumber),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primary, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value.isEmpty ? 'Not set' : value,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

