part of 'pages.dart';

class SurveyScreen extends StatefulWidget {

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  String? selectedGender = "Male"; // Default gender
  String? selectedActivity;
  String? selectedPurpose;

  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final List<String> activities = ["Low", "Medium", "High"];
  final List<String> purposes = ["Health", "Fitness", "Diet"];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void handleActivityChange(String? value) {
    setState(() {
      selectedActivity = value;
    });
  }
  void handlepurposeChange(String? value) {
    setState(() {
      selectedPurpose = value;
    });
  }

  // Function to submit the form data
  void submitForm() {
    if (selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select your gender")),
      );
      return;
    }
    if (ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your age")),
      );
      return;
    }
    if (heightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your height")),
      );
      return;
    }
    if (weightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your weight")),
      );
      return;
    }
    if (selectedActivity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select an activity level")),
      );
      return;
    }
    if (selectedPurpose == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select your purpose")),
      );
      return;
    }
    Map<String, dynamic> formData = {
      "gender": selectedGender,
      "age": ageController.text,
      "height": heightController.text,
      "weight": weightController.text,
      "routineActivity": selectedActivity,
      "purpose": selectedPurpose,
    };
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Form submitted successfully!")),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personalized Survey"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Customformfield(
                  question: "Username",
                  selectedController: usernameController,
                  hintText: "Enter username",
                ),
                SizedBox(height: 16),
                Text("What gender do you identify with?", style: GoogleFonts.archivo(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width:  MediaQuery.of(context).size.width * 0.3,
                      child: Row(
                        children: [
                          Radio<String>(
                            activeColor: AppColors.green,
                            value: "Male",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = "Male"; // Perbarui nilai radio
                                });
                              },
                              child: Text(
                                  "Male",
                                style: GoogleFonts.archivo(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width:  MediaQuery.of(context).size.width * 0.3,
                      child: Row(
                        children: [
                          Radio<String>(
                            activeColor: AppColors.green,
                            value: "Female",
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = "Female"; // Perbarui nilai radio
                                });
                              },
                              child: Text(
                                "Female",
                                style: GoogleFonts.archivo(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Customformfield(
                  question: "How old are you currently?",
                  selectedController: ageController,
                  hintText: "e.g., 25",
                  isNumber: true,
                ),
                SizedBox(height: 16),
                Customformfield(
                  question: "What is Your Height?",
                  selectedController: heightController,
                  hintText: "e.g., 170",
                  isNumber: true,
                  isUnit: true,
                  unit: "CM",
                ),
                SizedBox(height: 16),
                Customformfield(
                  question: "What is Your Current Weight?",
                  selectedController: weightController,
                  hintText: "e.g., 65",
                  isNumber: true,
                  isUnit: true,
                  unit: "KG",
                ),
                SizedBox(height: 16),
                Customdropdown(
                    question: "How Active is your Daily Routine?",
                    activities: activities,
                    hint: "choose an activity level",
                  onChanged: handleActivityChange,
                ),
                SizedBox(height: 16),
                Customdropdown(
                  question: "What is your main Purpose for Using this App?",
                  activities: purposes,
                  hint: "choose your main goal for this app",
                  onChanged: handlepurposeChange,
                ),
                SizedBox(height: 24),
                Custombutton(
                  detail: "Submit",
                  route: "/home",
                  submitForm:submitForm,
                  formKey: _formKey,
                  shouldNavigate: false,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
