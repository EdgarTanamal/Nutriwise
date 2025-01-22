import 'package:diabets/view/pages/pages.dart';
import 'package:diabets/viewmodel/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/network/firebaseService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriWise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/history', // Tentukan rute awal sebagai splash screen
      routes: {
        '/splash': (context) => const SplashScreen(), // Rute untuk splash screen
        '/home': (context) =>  HomeScreen(), // Rute untuk home screen
        '/login': (context) => LoginPage(), // Rute untuk login screen
        '/register': (context) => RegisterPage(), // Rute untuk register screen
        '/article': (context) => ArticlePage(), // Rute untuk article
        '/history': (context) => const HistoryDailyMealPage(), // Rute untuk history
        '/camera': (context) => CameraPage(), // Rute untuk camera
        '/introSurvey':(context) => IntroScreen(),
        '/survey':(context) => SurveyScreen(),

        //'/gallery': (context) => const GalleryPage(), // Rute untuk gallery screen
        //'/trashbin': (context) => const TrashbinPage(), // Rute untuk trashbin screen
      },
    );
  }
}
