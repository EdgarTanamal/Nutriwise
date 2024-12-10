// // home_screen.dart
// import 'package:diabets/view/pages/login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:diabets/data/network/firebaseAuthServices.dart';
//
// class HomeScreen extends StatelessWidget {
//   final FirebaseAuthService _authService = FirebaseAuthService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.exit_to_app),
//             onPressed: () async {
//               await _authService.signOut();
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => LoginScreen()),
//               );
//             },
//           )
//         ],
//       ),
//       body: Center(
//         child: Text('Welcome to Home Screen!'),
//       ),
//     );
//   }
// }
