import 'package:flutter/material.dart';
import '../../../app/themes/app_theme.dart';

class UserProfileEditForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController ageController;
  final TextEditingController addressController;
  final TextEditingController phoneController;
  final String selectedGender;
  final Function(String) onGenderChanged;
  final bool isLoading;
  final VoidCallback onSave;

  const UserProfileEditForm({
    super.key,
    required this.fullNameController,
    required this.ageController,
    required this.addressController,
    required this.phoneController,
    required this.selectedGender,
    required this.onGenderChanged,
    required this.isLoading,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: fullNameController,
          decoration: InputDecoration(
            labelText: 'Full Name',
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        const SizedBox(height: 16),

        DropdownButtonFormField<String>(
          value: selectedGender,
          decoration: InputDecoration(
            labelText: 'Gender',
            prefixIcon: const Icon(Icons.wc),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          items: const [
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
          ],
          onChanged: (value) {
            if (value != null) {
              onGenderChanged(value);
            }
          },
        ),

        const SizedBox(height: 16),

        TextField(
          controller: ageController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Age',
            prefixIcon: const Icon(Icons.cake),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        const SizedBox(height: 16),

        TextField(
          controller: addressController,
          maxLines: 2,
          decoration: InputDecoration(
            labelText: 'Address',
            prefixIcon: const Icon(Icons.location_on),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        const SizedBox(height: 16),

        TextField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Phone Number',
            prefixIcon: const Icon(Icons.phone),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        const SizedBox(height: 24),

        isLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onSave,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'SAVE CHANGES',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

        const SizedBox(height: 16),
      ],
    );
  }
}

