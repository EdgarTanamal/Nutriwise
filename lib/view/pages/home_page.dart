part of 'pages.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedMeal = "breakfast";
  @override
  Widget build(BuildContext context) {
    //calorie consumption
    double breakfastCalorie = 600;
    double lunchCalorie = 300;
    double dinnerCalorie = 300;
    double snackCalorie = 450;
    //calorie goal
    double breakfastGoal = 500;
    double lunchGoal = 500;
    double dinnerGoal = 500;
    double snackGoal = 500;


    //algorithm to calculate total calorie consumption and goal
    double totalcalorieConsumed = breakfastCalorie+lunchCalorie+dinnerCalorie+snackCalorie;
    double calorieGoal=breakfastGoal+lunchGoal+dinnerGoal+snackGoal;

    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight*0.4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Larger circle
                      CalorieProgressIndicator(
                        gradient: AppGradients.greenGradient,
                        calorieConsumed: totalcalorieConsumed,
                        calorieGoal: calorieGoal,
                        strokeWidth: 20,
                        sized:150,
                        name: "Kcal available",
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppPicture.consumePicture,
                            width: 30,  // Increased size for better visibility
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  "$totalcalorieConsumed",
                                  style: GoogleFonts.archivo(fontSize: 24, color: AppColors.textColor, fontWeight: FontWeight.bold)
                              ),
                              Text(
                                  "eaten",
                                  style: GoogleFonts.archivo(fontSize: 10, color: AppColors.subText)
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppPicture.caloriePicture,
                            width: 40,  // Increased size for better visibility
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 2),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  "$calorieGoal",
                                  style: GoogleFonts.archivo(fontSize: 24, color: AppColors.textColor, fontWeight: FontWeight.bold)
                              ),
                              Text(
                                  "Kcal Goal",
                                  style: GoogleFonts.archivo(fontSize: 10, color: AppColors.subText)
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightgreen,
                borderRadius: BorderRadius.circular(15), // Set your border radius here
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppPicture.mealPicture,
                      height: 36,
                      width: 36,
                    ),
                    SizedBox(width: 32),
                    Text("Scan Your Food Here!", style: GoogleFonts.archivo(fontSize: 15, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily Meals",
                        style: GoogleFonts.archivo(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textColor),
                      ),
                      Text(
                          "see all",
                        style: GoogleFonts.archivo(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.subText),
                      )
                    ],
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMeal = "breakfast";
                            });
                          },
                          child: CalorieProgressIndicator(
                            calorieConsumed: breakfastCalorie,
                            calorieGoal: breakfastGoal,
                            strokeWidth: 7,
                            sized: 65,
                            name: "Kcal",
                            totalCalorie: false,
                            gradient: AppGradients.greenGradient,
                            isSelected: selectedMeal == "breakfast",
                            picture: AppPicture.sunrisePicture,
                            color: AppColors.breakfastBG,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMeal = "lunch";
                            });
                          },
                          child: CalorieProgressIndicator(
                            gradient: AppGradients.redGradient,
                            calorieConsumed: lunchCalorie,
                            calorieGoal: lunchGoal,
                            strokeWidth: 7,
                            sized:65,
                            name: "Kcal",
                            picture: AppPicture.afternoonPicture,
                            totalCalorie: false,
                            color: AppColors.lunchBG,
                            isSelected: selectedMeal =="lunch",
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMeal = "dinner";
                            });
                          },
                          child: CalorieProgressIndicator(
                            totalCalorie: false,
                            gradient: AppGradients.blueGradient,
                            calorieConsumed: dinnerCalorie,
                            calorieGoal: dinnerGoal,
                            strokeWidth: 7,
                            sized:65,
                            name: "Kcal",
                            picture: AppPicture.moonPicture,
                            color: AppColors.dinnerBG,
                            isSelected: selectedMeal == "dinner",
                        
                        
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMeal = "snack";
                            });
                          },
                          child: CalorieProgressIndicator(
                            gradient: AppGradients.purpleGradient,
                            calorieConsumed: snackCalorie,
                            calorieGoal: snackGoal,
                            strokeWidth: 7,
                            sized:65,
                            name: "Kcal",
                            picture: AppPicture.snackPicture,
                            totalCalorie: false,
                            color: AppColors.snackBG,
                            isSelected: selectedMeal == "snack",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ) ,

            )

          )
        ],
      ),
    );
  }
}
