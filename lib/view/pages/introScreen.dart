part of 'pages.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppPicture.survey, height: 200), // Gambar ilustrasi
              SizedBox(height: 24),
              Text(
                "Let's Start with Information about yourself!",
                textAlign: TextAlign.center,
                style: GoogleFonts.archivo(
                    fontSize: 15,

                ),
              ),
              SizedBox(height: 24),
              Custombutton(detail: "Let's Start!", route: "/survey",shouldNavigate: true),
            ],
          ),
        ),
      ),
    );
  }
}
