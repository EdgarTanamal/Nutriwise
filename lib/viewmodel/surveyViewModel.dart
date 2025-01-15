part of 'viewmodel.dart';

class SurveyViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SurveyRepository? _surveyRepository;
  Future? _userRepository;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? selectedGender = "Male";
  String? selectedActivity;
  String? selectedPurpose;

  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final List<String> activities = ["Low", "Medium", "High"];
  final List<String> purposes = ["Health", "Fitness", "Diet"];

  void updateUsername() {
    User? firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      UserModel currentUser = UserModel(
        id: firebaseUser.uid,
        username: usernameController.text,
        email: firebaseUser.email,
        phone: firebaseUser.phoneNumber,
      );
      _userRepository = UserRepository().updateUser(currentUser);
    } else {
      print("Username is Empty");
    }
  }
  // Method to initialize the SurveyRepository
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



  // Handle activity selection change
  void handleActivityChange(String? value) {
    selectedActivity = value;
    notifyListeners();
  }

  // Handle purpose selection change
  void handlePurposeChange(String? value) {
    selectedPurpose = value;
    notifyListeners();
  }

  // Form validation
  String? validateForm() {
    if (selectedGender == null) return "Please select your gender";
    if (ageController.text.isEmpty) return "Please enter your age";
    if (heightController.text.isEmpty) return "Please enter your height";
    if (weightController.text.isEmpty) return "Please enter your weight";
    if (selectedActivity == null) return "Please select an activity level";
    if (selectedPurpose == null) return "Please select your purpose";
    return null;
  }

  // Submit form
  Future<void> submitForm() async {
    final error = validateForm();
    if (error != null) {
      throw Exception(error); // Handle error in the UI
    }

    _isLoading = true;
    notifyListeners();

    final survey = SurveyModel(
      gender: selectedGender!,
      age: ageController.text,
      height: heightController.text,
      weight: weightController.text,
      routineActivity: selectedActivity!,
      purpose: selectedPurpose!,
    );


    print(survey.toMap());
    try {
      initializeSurveyRepository();
      if (_surveyRepository != null) {
        await _surveyRepository!.createSurvey(survey); // Call the repository to create survey
        if(usernameController.text.isNotEmpty){
          updateUsername();
        }
      } else {
        print("Survey repository is not initialized");
        print(_surveyRepository);
      }
    } catch (e) {
      throw Exception("Failed to submit survey: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
