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
    Const.initializeCache(); // Menginisialisasi cache atau pengaturan awal
    // Tunda navigasi ke halaman beranda selama 4 detik
    Future.delayed(const Duration(seconds: 4), () async {
      if (Const.userId != 0 && Const.auth.isNotEmpty) {
        // Jika user sudah login, arahkan ke halaman home
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Jika user belum login, arahkan ke halaman register
        Navigator.pushReplacementNamed(context, '/register');
      }
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
