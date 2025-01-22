part of 'pages.dart';

class IntroScreen extends StatelessWidget {
  DateTime? lastBackPressed;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (lastBackPressed == null || DateTime.now().difference(lastBackPressed!) > Duration(seconds: 2)) {
          lastBackPressed = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Press back again to exit',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              duration: Duration(milliseconds: 1500),
            ),
          );
          return false; // Do not exit app
        }
        return true; // Exit app
      },
      child: Scaffold(
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
      ),
    );
  }
}
