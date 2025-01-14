part of 'pages.dart';

class SurveyScreen extends StatefulWidget {

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SurveyViewModel surveyViewModel =SurveyViewModel();

  // Function to submit the form data
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
                  selectedController: surveyViewModel.usernameController,
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
                            groupValue: surveyViewModel.selectedGender,
                            onChanged: (value) {
                              setState(() {
                                surveyViewModel.selectedGender = value;
                              });
                            },
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  surveyViewModel.selectedGender = "Male"; // Perbarui nilai radio
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
                            groupValue: surveyViewModel.selectedGender,
                            onChanged: (value) {
                              setState(() {
                                surveyViewModel.selectedGender = value;
                              });
                            },
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  surveyViewModel.selectedGender = "Female"; // Perbarui nilai radio
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
                  selectedController: surveyViewModel.ageController,
                  hintText: "e.g., 25",
                  isNumber: true,
                ),
                SizedBox(height: 16),
                Customformfield(
                  question: "What is Your Height?",
                  selectedController: surveyViewModel.heightController,
                  hintText: "e.g., 170",
                  isNumber: true,
                  isUnit: true,
                  unit: "CM",
                ),
                SizedBox(height: 16),
                Customformfield(
                  question: "What is Your Current Weight?",
                  selectedController: surveyViewModel.weightController,
                  hintText: "e.g., 65",
                  isNumber: true,
                  isUnit: true,
                  unit: "KG",
                ),
                SizedBox(height: 16),
                Customdropdown(
                    question: "How Active is your Daily Routine?",
                    activities: surveyViewModel.activities,
                    hint: "choose an activity level",
                  onChanged: surveyViewModel.handleActivityChange,
                ),
                SizedBox(height: 16),
                Customdropdown(
                  question: "What is your main Purpose for Using this App?",
                  activities: surveyViewModel.purposes,
                  hint: "choose your main goal for this app",
                  onChanged: surveyViewModel.handlePurposeChange,
                ),
                SizedBox(height: 24),
                Custombutton(
                  detail: "Submit",
                  route: "/home",
                  submitForm: surveyViewModel.submitForm,
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
