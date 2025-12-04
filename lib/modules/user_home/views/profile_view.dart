// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
// import '../../../app/routes/app_routes.dart';
// import '../../../modules/auth/viewmodels/auth_controller.dart';
// import '../viewmodels/user_profile_controller.dart';
//
// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final ProfileController c = Get.put(ProfileController());
//     final AuthController auth = Get.find();
//
//     return Scaffold(
//
//       appBar: AppBar(
//         title: const Text('Profile'),
//         centerTitle: true,
//         backgroundColor: AppTheme.primary,
//         foregroundColor: Colors.white,
//
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               if (auth.currentUser != null) {
//                 auth.currentUser.value = null;
//               }
//               Get.offAllNamed(AppRoutes.login);
//             },
//           )
//         ],
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             children:
//             [
//               Container(
//                 height: 90,
//                 width: 90,
//                 decoration: BoxDecoration(
//                   color: AppTheme.primary.withOpacity(0.08),
//                   shape: BoxShape.circle,
//                 ),
//
//                 child: const Icon(
//                     Icons.person,
//                     size: 48,
//                     color: AppTheme.primary
//                 ),
//               ),
//
//               const SizedBox(height: 14),
//
//               TextField(
//                 controller: c.nameController,
//                 decoration: const InputDecoration(
//                     labelText: 'Full Name'
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               TextField(
//                 controller: c.ageController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                     labelText: 'Age'
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               DropdownButtonFormField<String>(
//                 value: c.selectedGender.value,
//                 decoration: const InputDecoration(
//                     labelText: 'Gender'
//                 ),
//                 items: ['Male', 'Female', 'Other']
//                     .map((g) => DropdownMenuItem(value: g, child: Text(g)))
//                     .toList(),
//                 onChanged: (val) {
//                   if (val != null) c.selectedGender.value = val;
//                 },
//               ),
//
//               const SizedBox(height: 10),
//
//               TextField(
//                 controller: c.phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: const InputDecoration(
//                     labelText: 'Phone Number'
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               TextField(
//                 controller: c.addressController,
//                 decoration: const InputDecoration(
//                     labelText: 'Address'
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     c.saveProfile();
//                     Get.offAllNamed(AppRoutes.userHome);
//                   },
//                   child: const Text('Save & Continue', style: TextStyle(
//                     color: Colors.white
//                   ),),
//                 ),
//               ),
//
//               const SizedBox(height: 12),
//
//               TextButton(
//                 onPressed: () {
//                   auth.currentUser.value = null;
//                   Get.offAllNamed(AppRoutes.login);
//                 },
//                 child: const Text('Back to Login'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
