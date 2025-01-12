// // login_screen.dart
// import 'package:flutter/material.dart';
// import 'package:diabets/data/network/firebaseAuthServices.dart';
// import 'signup_screen.dart'; // Link ke halaman signup
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _authService = FirebaseAuthService();
//   bool _isLoading = false;
//
//   void _login() async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();
//
//     if (email.isEmpty || password.isEmpty) {
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }
//
//     final user = await _authService.signInWithEmail(email, password);
//
//     setState(() {
//       _isLoading = false;
//     });
//
//     if (user != null) {
//       // Navigate ke Home Screen setelah berhasil login
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } else {
//       _showErrorDialog('Failed to login. Please try again.');
//     }
//   }
//
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text('Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             child: Text('Okay'),
//             onPressed: () => Navigator.of(ctx).pop(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             _isLoading
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignUpScreen()),
//                 );
//               },
//               child: Text('Don\'t have an account? Sign up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
