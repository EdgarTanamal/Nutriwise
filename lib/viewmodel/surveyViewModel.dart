part of 'viewmodel.dart';
//
// class SurveyViewModel extends ChangeNotifier{

class SurveyViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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

  void handleActivityChange(String? value) {
    selectedActivity = value;
    notifyListeners();
  }

  void handlePurposeChange(String? value) {
    selectedPurpose = value;
    notifyListeners();
  }

  String? validateForm() {
    if (selectedGender == null) return "Please select your gender";
    if (ageController.text.isEmpty) return "Please enter your age";
    if (heightController.text.isEmpty) return "Please enter your height";
    if (weightController.text.isEmpty) return "Please enter your weight";
    if (selectedActivity == null) return "Please select an activity level";
    if (selectedPurpose == null) return "Please select your purpose";
    return null;
  }

  Future<void> submitForm() async {
    final error = validateForm();
    if (error != null) {
      throw Exception(error); // Tangani error di UI
    }
    _isLoading=true;
    notifyListeners();
    final survey = SurveyModel(
      username: usernameController.text,
      gender: selectedGender!,
      age: ageController.text,
      height: heightController.text,
      weight: weightController.text,
      routineActivity: selectedActivity!,
      purpose: selectedPurpose!,
    );

    print(survey.toMap());
    try{
      // await repository.createSurvey(survey);
    }catch(e){
      throw Exception("Failed to submit survey: $e");

    }finally{
      _isLoading=false;
      notifyListeners();
    }
  }
}


//   final SurveyRepository _surveyService;
//   final UserModel currentUser;
//   bool _isLoading = false;
//
//   SurveyViewModel({
//     required this.currentUser,
//   }) : _surveyService = SurveyRepository(currentUser);
//
//   bool get isLoading => _isLoading;
//
//   Future<void> createSurvey(SurveyModel survey) async{
//     _isLoading = true;
//     notifyListeners();
//     try{
//       await _surveyService.createSurvey(survey);
//     }catch(e){
//       print("Error creating survey: $e");
//     }finally{
//       _isLoading= false;
//       notifyListeners();
//     }
//   }
// }