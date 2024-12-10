import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: 'AIzaSyChUHKkYIpIwMuSpUM8S3AYULC_nEMH-pc',
            appId: '1:605379824241:android:2b69e63ed17fec9e3129d0',
            messagingSenderId: '605379824241',
            projectId: 'diabets2-f2f8e',
          )
      );
      print("Firebase initialized successfully");
    } catch (e) {
      print("Error initializing Firebase: $e");
      throw Exception("Firebase initialization failed");
    }
  }
}
