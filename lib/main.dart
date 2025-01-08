import 'package:diabets/view/pages/pages.dart';
import 'package:diabets/view/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'data/network/firebaseAuthServices.dart';
import 'data/network/firebaseService.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash', // Tentukan rute awal sebagai splash screen
      routes: {
        '/splash': (context) => const SplashScreen(), // Rute untuk splash screen
        '/home': (context) =>  HomeScreen(), // Rute untuk home screen
        '/login': (context) => LoginPage(), // Rute untuk login screen
        '/register': (context) => RegisterPage(), // Rute untuk register screen
        //'/gallery': (context) => const GalleryPage(), // Rute untuk gallery screen
        //'/trashbin': (context) => const TrashbinPage(), // Rute untuk trashbin screen
      },
    );
  }
}