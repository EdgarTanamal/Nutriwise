part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Pastikan Firebase sudah selesai inisialisasi
    Firebase.initializeApp().then((_) {
      Future.delayed(const Duration(seconds: 4), () async {
        try {
          // Mengakses LoginViewModel untuk mendapatkan route
          final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
          final route = await loginViewModel.handleUserNavigation();
          // Jika route tidak null, lakukan navigasi
          if (route != null) {
            // Navigasi setelah menunggu 4 detik
            if (mounted) {
              await Navigator.pushReplacementNamed(context, route);
            }
          }
        } catch (e) {
          print('Error navigating user: $e');
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF91C788), // Warna latar belakang hijau muda
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(height: 24),
            Text(
              'NutriWise',
              style: TextStyle(
                fontSize: 32,
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Warna teks putih
              ),
            ),
          ],
        ),
      ),
    );
  }
}
