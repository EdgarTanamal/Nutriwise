part of 'shared.dart';



class AppColors{
  static const Color lightgreen = Color(0xFF53D28F); // light Green
  static const Color green = Color(0xFF2ED12E); // dark Green
  static const Color grey = Color(0xFFF2F5FC); // Blue
  static const Color lightyellow = Color(0xFFFDCF0F); //light yellow
  static const Color yellow = Color(0xFFFFAD31); //yellow


  static const Color accentColor = Color(0xFFFF5722); // Orange
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light grey


  static const Color textColor = Color(0xFF333333); // Dark grey
  static const Color subText = Color(0xFF9DA8C3); // light blue
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