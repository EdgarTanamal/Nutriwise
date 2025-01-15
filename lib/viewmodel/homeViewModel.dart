part of'viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  // Meal types and their respective calorie values
  final int breakfastCalorie = 600;
  final int lunchCalorie = 300;
  final int dinnerCalorie = 500;
  final int snackCalorie = 400;

  final int breakfastGoal = 500;
  final int lunchGoal = 500;
  final int dinnerGoal = 500;
  final int snackGoal = 500;

  String selectedMeal = "Breakfast";
  DateTime? lastBackPressed;

  // Calorie consumption and goal for the selected meal
  int calorieConsumed = 0;
  int calorieGoal = 0;

  // Total calorie consumption and goal
  int totalCalorieConsumed = 0;
  int totalCalorieGoal = 0;

  // Method to update the selected meal
  void updateSelectedMeal(String meal) {
    selectedMeal = meal;
    _updateCalorieValues();
    notifyListeners();
  }

  // Method to update calorie values based on the selected meal
  void _updateCalorieValues() {
    switch (selectedMeal) {
      case "Breakfast":
        calorieConsumed = breakfastCalorie;
        calorieGoal = breakfastGoal;
        break;
      case "Lunch":
        calorieConsumed = lunchCalorie;
        calorieGoal = lunchGoal;
        break;
      case "Dinner":
        calorieConsumed = dinnerCalorie;
        calorieGoal = dinnerGoal;
        break;
      case "Snack":
        calorieConsumed = snackCalorie;
        calorieGoal = snackGoal;
        break;
    }
    // Update total calorie consumption and goal
    totalCalorieConsumed = breakfastCalorie + lunchCalorie + dinnerCalorie + snackCalorie;
    totalCalorieGoal = breakfastGoal + lunchGoal + dinnerGoal + snackGoal;
  }

  // Method to handle back button press
  Future<bool> onBackPressed(BuildContext context) async {
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
  }

  // Get current calorie status
  // String get currentCalorieStatus {
  //   return "$calorieConsumed / $calorieGoal Kcal";
  // }
  //
  // // Get total calorie status
  // String get totalCalorieStatus {
  //   return "$totalCalorieConsumed / $totalCalorieGoal Kcal";
  // }
}
