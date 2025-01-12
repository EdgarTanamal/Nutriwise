// import 'package:flutter/material.dart';
// import 'package:diabets/data/network/firebaseAuthServices.dart';
// import 'package:diabets/repository/user/userRepository.dart'; // Import UserRepository
// import 'package:diabets/model/user.dart'; // Import UserModel
// import 'login_screen.dart'; // Link to login page
//
// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _authService = FirebaseAuthService();
//   final _userRepository = UserRepository(); // Initialize UserRepository
//   bool _isLoading = false;
//
//   void _signUp() async {
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
//     try {
//       // Sign up user with Firebase Authentication
//       final user = await _authService.signUpWithEmail(email, password);
//
//       if (user != null) {
//         // Create user model after successful signup
//         final newUser = UserModel(
//           id: user.uid,
//           name: 'Default Name', // Replace with name input if available
//           email: email,
//           phone: '', // Optional: Add a phone number input field if required
//           profilePicture: null, // Optional: Add a profile picture field if required
//         );
//
//         // Save user data to Firestore
//         await _userRepository.createUser(newUser);
//
//         // Navigate to Home Screen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//       } else {
//         _showErrorDialog('Failed to sign up. Please try again.');
//       }
//     } catch (e) {
//       _showErrorDialog('Error during sign-up: $e');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
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
//       appBar: AppBar(title: Text('Sign Up')),
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
//               onPressed: _signUp,
//               child: Text('Sign Up'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginScreen()),
//                 );
//               },
//               child: Text('Already have an account? Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
