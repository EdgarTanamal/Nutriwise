part of 'shared.dart';

class Const {
  static int userId = 0;
  static String auth = '';

  static late final SharedPreferences sharedPrefs;
  static late final JsonCacheMem jsonCache;


 static void initializeCache() async {
    sharedPrefs = await SharedPreferences.getInstance();
    jsonCache = JsonCacheMem(JsonCacheSharedPreferences(sharedPrefs));
    _refreshCache();
  }

  // Saving preferences data
  static Future<void> signIn(int userId, String auth) async {
    await jsonCache.refresh('profile', {'userId': userId, 'auth': auth});
    _refreshCache();
  }

  // Frees up cached data before the user leaves the application.
  static Future<void> signout() async {
    await jsonCache.clear();
    _refreshCache();
  }

  // Refreshing cache
  static void _refreshCache() async {
    final maps = await jsonCache.value('profile');
    if (maps != null) {
      userId = maps['userId'];
      auth = maps['auth'];
    }
  }  
}

class AppColors{
  static const Color lightgreen = Color(0xFF53D28F); // light Green
  static const Color green = Color(0xFF2ED12E); // dark Green
  static const Color grey = Color(0xFFCFCFCF);
  static const Color lightyellow = Color(0xFFFDCF0F); //light yellow
  static const Color yellow = Color(0xFFFFAD31); //yellow
  static const Color lightred = Color(0xFFC78889);
  static const Color red = Color(0xFFD12E31);
  static const Color lightBlue = Color(0xFF5C6CD9);
  static const Color blue = Color(0xFF4166F5);
  static const Color lightPurple = Color(0xFFB575E7);
  static const Color purple = Color(0xFFE341F5);

  static const Color breakfastBG = Color(0xFFA0E4A0);
  static const Color lunchBG = Color(0xFFFF888A);
  static const Color dinnerBG = Color(0xFFAAC4FF);
  static const Color snackBG = Color(0xFFD4A9F5);


  static const Color backgroundColor = Color(0xFFF5F5F5); // Light grey
  static const Color backgroundCard = Color(0xFFFFFFFF);

  static const Color textColor = Color(0xFF333333); // Dark grey
  static const Color subText = Color(0xFF9DA8C3); // light blue
  static const Color button = Color(0xFF91C788);
}

class AppGradients {
  // Define a linear gradient with the green color
  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.lightgreen, // Your green color
      AppColors.green, // Another color to blend with
    ],
  );
  static const LinearGradient yellowGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.lightyellow, // Your green color
      AppColors.yellow, // Another color to blend with
    ],
  );
  static const LinearGradient redGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.lightred, // Your green color
      AppColors.red, // Another color to blend with
    ],
  );
  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.lightBlue, // Your green color
      AppColors.blue, // Another color to blend with
    ],
  );
  static const LinearGradient purpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.lightPurple, // Your green color
      AppColors.purple, // Another color to blend with
    ],
  );

  // Define a radial gradient with the green color
  // static const RadialGradient greenRadialGradient = RadialGradient(
  //   center: Alignment.center,
  //   radius: 0.8,
  //   colors: [
  //     AppColors.green, // Your green color
  //     Colors.blue, // Another color
  //   ],
  // );
}

class AppPicture{
  static const String caloriePicture = "assets/images/fire.png";
  static const String consumePicture = "assets/images/restaurant.png";
  static const String mealPicture = "assets/images/meal.png";
  static const String sunrisePicture = "assets/images/sunrise.png";
  static const String moonPicture = "assets/images/moon.png";
  static const String afternoonPicture = "assets/images/weather.png";
  static const String snackPicture = "assets/images/apple.png";
  static const String plusPicture = "assets/images/plus.png";
  static const String calendar = "assets/images/calendar.png";
  static const String notification = "assets/images/bell.png";
  static const String activenotification = "assets/images/active.png";
  static const String history = "assets/images/history.png";
  static const String historyActive = "assets/images/historyActive.png";
  static const String home = "assets/images/home.png";
  static const String homeActive = "assets/images/homeActive.png";
  static const String search = "assets/images/search.png";
  static const String searchActive = "assets/images/searchActive.png";
  static const String user = "assets/images/user.png";
  static const String userActive = "assets/images/userActive.png";
  static const String camera = "assets/images/camera.png";
  static const String survey = "assets/images/survey.png";
}


