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
        AppTheme.inputField(
          controller: fullNameController,
          hint: 'Enter your full name',
          label: 'Full Name',
          icon: Icons.person,
        ),

        AppTheme.spacerMedium(),

        DropdownButtonFormField<String>(

          initialValue: selectedGender,
          decoration: InputDecoration(
            labelText: 'Gender',
            prefixIcon: const Icon(Icons.wc),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),

          items: const [
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
          ],

          onChanged: (value) {
            if (value != null) onGenderChanged(value);
          },
        ),

        AppTheme.spacerMedium(),

        AppTheme.inputField(
          controller: ageController,
          hint: 'Enter your age',
          label: 'Age',
          icon: Icons.cake,
          keyboardType: TextInputType.number,
        ),

        AppTheme.spacerMedium(),

        AppTheme.inputField(
          controller: addressController,
          hint: 'Enter your address',
          label: 'Address',
          icon: Icons.location_on,
          maxLines: 2,
        ),

        AppTheme.spacerMedium(),

        AppTheme.inputField(
          controller: phoneController,
          hint: 'Enter your phone number',
          label: 'Phone Number',
          icon: Icons.phone,
          keyboardType: TextInputType.phone,
        ),

        AppTheme.spacerLarge(),

        AppTheme.primaryButton(
          text: 'SAVE CHANGES',
          onPressed: onSave,
          isLoading: isLoading,
        ),

        AppTheme.spacerMedium(),
      ],
    );
  }
}

