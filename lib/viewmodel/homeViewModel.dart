part of'viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  SurveyModel? surveyDetails;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SurveyRepository? _surveyRepository;
  String selectedMeal = "Breakfast";
  late Color cardColor;
  late List<Map<String, String>> descriptionCards;




  // Meal types and their respective calorie values
  int breakfastCalorie = 0;
  int lunchCalorie = 0;
  int dinnerCalorie = 0;
  int snackCalorie = 0;

  int breakfastGoal = 0;
  int lunchGoal = 0;
  int dinnerGoal = 0;
  int snackGoal = 0;

  bool _isLoading= false;
  bool get isLoading => _isLoading;


  DateTime? lastBackPressed;

  // Calorie consumption and goal for the selected meal
  int calorieConsumed = 0;
  int calorieGoal = 0;

  // Total calorie consumption and goal
  int totalCalorieConsumed = 0;
  int totalCalorieGoal = 0;
  int calorieLeft = 0;


  // Method to update the selected meal
  void updateSelectedMeal(String meal) {
    selectedMeal = meal;
    updateCalorieValues();
    notifyListeners();
  }

  // Method to update calorie values based on the selected meal
  void updateCalorieValues() {
    switch (selectedMeal) {
      case "Breakfast":
        cardColor =AppColors.green;
        descriptionCards = [
          {"food": "Coffee with milk", "amount": "100g", "calorie": "56 Kcal"},
          {"food": "Sandwich", "amount": "100g", "calorie": "250 Kcal"},
          {"food": "Omelette", "amount": "100g", "calorie": "100 Kcal"},
        ];
        calorieConsumed = breakfastCalorie;
        calorieGoal = breakfastGoal;
        break;
      case "Lunch":
        cardColor = AppColors.red; // Warna merah
        descriptionCards = [
          {"food": "Grilled Chicken", "amount": "200g", "calorie": "300 Kcal"},
          {"food": "Rice", "amount": "150g", "calorie": "200 Kcal"},
          {"food": "Salad", "amount": "100g", "calorie": "50 Kcal"},
        ];
        calorieConsumed = lunchCalorie;
        calorieGoal = lunchGoal;
        break;
      case "Dinner":
        cardColor = AppColors.blue; // Warna biru
        descriptionCards = [
          {"food": "Soup", "amount": "150g", "calorie": "100 Kcal"},
          {"food": "Steak", "amount": "200g", "calorie": "400 Kcal"},
          {"food": "Veggies", "amount": "100g", "calorie": "70 Kcal"},
        ];
        calorieConsumed = dinnerCalorie;
        calorieGoal = dinnerGoal;
        break;
      case "Snack":
        cardColor = AppColors.purple; // Warna ungu
        descriptionCards = [
          {"food": "Chips", "amount": "50g", "calorie": "150 Kcal"},
          {"food": "Cookies", "amount": "100g", "calorie": "250 Kcal"},
          {"food": "Juice", "amount": "200ml", "calorie": "100 Kcal"},
        ];
        calorieConsumed = snackCalorie;
        calorieGoal = snackGoal;
        break;
      default:
        cardColor = AppColors.backgroundCard; // Default warna kartu
        descriptionCards = [];
    }
    notifyListeners();
    // Update total calorie consumption and goal
  }

  Map<String, double> activityFactor = {
    "Lightly Active (Office Job)": 1.1,
    "Moderately Active": 1.25,
    "Very Active (Mostly Physically Job)": 1.5,
    "Extremely Active (Heavy Physically Job)": 1.75,
  };

  Map<String, double> purposeFactor = {
    "Weight Loss": 0.85, // contoh
    "Healthy": 1.0,
    "Weight Gain": 1.15,
  };


  int calculateDailyCalorieNeeds() {
    if (surveyDetails == null) return 0;

    // Ambil nilai dari surveyDetails dan konversikan jika diperlukan
    final age = double.tryParse(surveyDetails!.age.toString() ?? '0.0'); // Konversi ke num
    final gender = surveyDetails!.gender ?? "Male";
    final weight = double.tryParse(surveyDetails!.weight.toString() ?? '0.0'); // Konversi ke num
    final height = double.tryParse(surveyDetails!.height.toString() ?? '0.0'); // Konversi ke num
    final activity = surveyDetails!.routineActivity ?? "Lightly active";
    final purpose = surveyDetails!.purpose ?? "Maintain weight";

    print(age);
    print(gender);
    print(weight);
    print(height);
    print(activity);
    print(purpose);

    // Gunakan multiplier dari konstanta
    final activityMultiplier = activityFactor[activity] ?? 1.1;
    final purposeMultiplier = purposeFactor[purpose] ?? 1.0;
    print(activityMultiplier);
    print(purposeMultiplier);


    // Formula untuk perempuan
    if (gender == "Female") {
      return ((655 + (9.6 * weight!) + (1.8 * height!) - (4.7 * age!)) *
          activityMultiplier * purposeMultiplier).round();
    }
    // Formula untuk laki-laki
    else {
      return ((66 + (13.7 * weight!) + (5 * height!) - (6.8 * age!)) *
          activityMultiplier * purposeMultiplier).round();
    }
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

  void initializeSurveyRepository() {
    User? firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      UserModel currentUser = UserModel(
        id: firebaseUser.uid,
        username: firebaseUser.displayName,
        email: firebaseUser.email,
        phone: firebaseUser.phoneNumber,
      );
      _surveyRepository = SurveyRepository(currentUser);
    } else {
      print("No user is logged in");
    }
  }
  Future<void>fetchSurveyDetails() async{
    updateSelectedMeal(selectedMeal);
    initializeSurveyRepository();


    _isLoading=true;
    notifyListeners();
    try{
      surveyDetails = await _surveyRepository?.readSurveyDetails();
      if(surveyDetails!=null){
        print('Survey details fetched successfully: ${surveyDetails!.toMap()}');
        totalCalorieGoal = calculateDailyCalorieNeeds();
        breakfastGoal = (0.3*totalCalorieGoal).round() ;
        lunchGoal = (0.4*totalCalorieGoal).round();
        dinnerGoal = (0.2*totalCalorieGoal).round();
        snackGoal = (0.1*totalCalorieGoal).round();
        // calorieLeft = totalCalorieGoal-totalCalorieConsumed;
        // breakfastCalorie = breakfastCalorie+50;
        // lunchCalorie=lunchCalorie+100;
        // dinnerCalorie=dinnerCalorie+400;
        // totalCalorieConsumed = breakfastCalorie + lunchCalorie + dinnerCalorie + snackCalorie;
        print(totalCalorieGoal);
        updateCalorieValues();


      }else{
        print('No survey found');
      }
      notifyListeners();
    }catch(e){
      print('Error fetching survey details: $e');
    }finally{
      _isLoading=false;
      notifyListeners();
    }

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
