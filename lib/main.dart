import 'package:camera/camera.dart';
import 'package:diabets/view/pages/camera_page.dart';
import 'package:diabets/view/pages/pages.dart';
import 'package:diabets/viewmodel/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/network/firebaseService.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  await FirebaseService.initializeFirebase();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: MyApp(cameras: cameras),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriWise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash', // Ensure this matches an existing route
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/article': (context) => ArticlePage(),
        '/history': (context) => const HistoryDailyMealPage(),
        '/camera': (context) => CameraPage(cameras: cameras),
        '/introSurvey': (context) => IntroScreen(),
        '/survey': (context) => SurveyScreen(),
        '/notification': (context) => NotificationPage(),
      },
    );
  }
}
