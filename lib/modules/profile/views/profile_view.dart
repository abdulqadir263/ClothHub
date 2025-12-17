import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../profile_viewmodel.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final viewModel = Get.find<ProfileViewModel>();
    fullNameController.addListener(() => viewModel.fullName.value = fullNameController.text);
    ageController.addListener(() => viewModel.age.value = int.tryParse(ageController.text) ?? 0);
    addressController.addListener(() => viewModel.address.value = addressController.text);
    phoneController.addListener(() => viewModel.phoneNumber.value = phoneController.text);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    ageController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProfileViewModel viewModel = Get.find<ProfileViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Profile'),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile Details', style: AppTheme.headingText),
            AppTheme.spacerMedium(),
            _buildProfileForm(viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileForm(ProfileViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Icon(Icons.person_outline, size: 80, color: AppTheme.primary)),
        AppTheme.spacerMedium(),
        const Center(child: Text('Complete Your Profile', style: AppTheme.headingText)),
        AppTheme.spacerLarge(),
        AppTheme.inputField(
          controller: fullNameController,
          hint: 'Enter your full name',
          label: 'Full Name',
          icon: Icons.person,
        ),
        AppTheme.spacerMedium(),
        Obx(() => DropdownButtonFormField<String>(
          initialValue: viewModel.gender.value,
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
            if (value != null) viewModel.gender.value = value;
          },
        )),
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
        Obx(() => AppTheme.primaryButton(
          text: 'SAVE PROFILE',
          onPressed: () => viewModel.saveProfile(),
          isLoading: viewModel.isLoading.value,
        )),
      ],
    );
  }
}
