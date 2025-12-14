import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_theme.dart';
import '../../user_home/user_home_viewmodel.dart';
import '../../../data/repositories/user_repository.dart';
import 'user_profile_card.dart';
import 'user_profile_edit_form.dart';

class UserProfileTabView extends StatefulWidget {
  const UserProfileTabView({super.key});

  @override
  State<UserProfileTabView> createState() => _UserProfileTabViewState();
}

class _UserProfileTabViewState extends State<UserProfileTabView> {
  final UserHomeViewModel viewModel = Get.find<UserHomeViewModel>();
  final UserRepository userRepo = Get.find<UserRepository>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  var isEditing = false;
  var isLoading = false;
  var selectedGender = 'Male';

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  void loadProfileData() {
    final user = viewModel.userProfile.value;
    if (user != null) {
      fullNameController.text = user.fullName;
      ageController.text = user.age > 0 ? user.age.toString() : '';
      addressController.text = user.address;
      phoneController.text = user.phoneNumber;
      selectedGender = user.gender.isNotEmpty ? user.gender : 'Male';
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    ageController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> saveProfile() async {
    if (fullNameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your full name');
      return;
    }
    if (phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your phone number');
      return;
    }

    setState(() => isLoading = true);

    try {
      final currentUser = viewModel.userProfile.value;
      if (currentUser == null) {
        Get.snackbar('Error', 'User not found');
        return;
      }

      final updatedData = {
        'fullName': fullNameController.text,
        'gender': selectedGender,
        'age': int.tryParse(ageController.text) ?? 0,
        'address': addressController.text,
        'phoneNumber': phoneController.text,
      };

      await userRepo.updateUserProfile(currentUser.uid, updatedData);
      await viewModel.loadUserProfile();

      setState(() => isEditing = false);
      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() {
        final user = viewModel.userProfile.value;

        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!isEditing) {
          loadProfileData();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            Center(
              child: Text(
                user.email,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Profile Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                      if (!isEditing) loadProfileData();
                    });
                  },
                  icon: Icon(
                    isEditing ? Icons.close : Icons.edit,
                    color: AppTheme.primary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            if (isEditing)
              UserProfileEditForm(
                fullNameController: fullNameController,
                ageController: ageController,
                addressController: addressController,
                phoneController: phoneController,
                selectedGender: selectedGender,
                onGenderChanged: (value) => setState(() => selectedGender = value),
                isLoading: isLoading,
                onSave: saveProfile,
              )
            else
              UserProfileCard(user: user),
          ],
        );
      }),
    );
  }
}

