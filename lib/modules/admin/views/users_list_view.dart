// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/themes/app_theme.dart';
//
// class UsersListView extends StatelessWidget {
//   const UsersListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final mockUsers = [
//       {'name': 'Ali', 'email': 'ali@gmail.com'},
//       {'name': 'Sara', 'email': 'sara@gmail.com'},
//       {'name': 'Hamza', 'email': 'hamza@gmail.com'},
//
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Users'),
//         backgroundColor: AppTheme.primary,
//         foregroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Get.back(),
//         ),
//       ),
//
//       body: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: mockUsers.length,
//         itemBuilder: (context, index)
//         {
//           final u = mockUsers[index];
//           return Card(
//             child: ListTile(
//               title: Text(u['name']!),
//               subtitle: Text(u['email']!),
//               trailing: const Icon(
//                   Icons.delete,
//                   color: Colors.red
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
