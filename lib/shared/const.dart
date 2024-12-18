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