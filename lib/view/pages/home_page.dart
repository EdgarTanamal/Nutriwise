part of 'pages.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedMeal = "Breakfast";
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


    double calorieConsumed =0;
    double calorieGoal= 0;
    if (selectedMeal == "Breakfast") {
      calorieConsumed = breakfastCalorie;
      calorieGoal = breakfastGoal;
    } else if (selectedMeal == "Lunch") {
      calorieConsumed = lunchCalorie;
      calorieGoal = lunchGoal;
    } else if (selectedMeal == "Dinner") {
      calorieConsumed = dinnerCalorie;
      calorieGoal = dinnerGoal;
    } else if (selectedMeal == "Snack") {
      calorieConsumed = snackCalorie;
      calorieGoal = snackGoal;
    }


    //algorithm to calculate total calorie consumption and goal
    double totalcalorieConsumed = breakfastCalorie+lunchCalorie+dinnerCalorie+snackCalorie;
    double totalcalorieGoal=breakfastGoal+lunchGoal+dinnerGoal+snackGoal;

    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width*0.6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Flexible(
                        child: CalorieProgressIndicator(
                          gradient: AppGradients.greenGradient,
                          calorieConsumed: totalcalorieConsumed,
                          calorieGoal: totalcalorieGoal,
                          name: "Kcal available",
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
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
                                      "$totalcalorieGoal",
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
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                selectedMeal = "Breakfast";
                              });
                            },
                            child: CalorieProgressIndicator(
                              calorieConsumed: breakfastCalorie,
                              calorieGoal: breakfastGoal,
                              name: "Kcal",
                              totalCalorie: false,
                              gradient: AppGradients.greenGradient,
                              isSelected: selectedMeal == "Breakfast",
                              picture: AppPicture.sunrisePicture,
                              color: AppColors.breakfastBG,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMeal = "Lunch";
                              });
                            },
                            child: CalorieProgressIndicator(
                              gradient: AppGradients.redGradient,
                              calorieConsumed: lunchCalorie,
                              calorieGoal: lunchGoal,
                              name: "Kcal",
                              picture: AppPicture.afternoonPicture,
                              totalCalorie: false,
                              color: AppColors.lunchBG,
                              isSelected: selectedMeal =="Lunch",
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMeal = "Dinner";
                              });
                            },
                            child: CalorieProgressIndicator(
                              totalCalorie: false,
                              gradient: AppGradients.blueGradient,
                              calorieConsumed: dinnerCalorie,
                              calorieGoal: dinnerGoal,
                              name: "Kcal",
                              picture: AppPicture.moonPicture,
                              color: AppColors.dinnerBG,
                              isSelected: selectedMeal == "Dinner",


                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMeal = "Snack";
                              });
                            },
                            child: CalorieProgressIndicator(
                              gradient: AppGradients.purpleGradient,
                              calorieConsumed: snackCalorie,
                              calorieGoal: snackGoal,
                              name: "Kcal",
                              picture: AppPicture.snackPicture,
                              totalCalorie: false,
                              color: AppColors.snackBG,
                              isSelected: selectedMeal == "Snack",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    dailyMealsCard(
                        calorieConsumed: calorieConsumed,
                        calorieGoal: calorieGoal,
                        isSelected:selectedMeal
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended Meals",
                          style: GoogleFonts.archivo(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textColor),
                        ),
                        Text(
                          "see all",
                          style: GoogleFonts.archivo(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.subText),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ArticleCard(picture: "picture", isArticle: false,food: "FOOD",calorie: 300,),
                          ArticleCard(picture: "picture", isArticle: false,food: "FOOD",calorie: 300,),
                          ArticleCard(picture: "picture", isArticle: false,food: "FOOD",calorie: 300,)
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Newest Article",
                          style: GoogleFonts.archivo(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textColor),
                        ),
                        Text(
                          "see all",
                          style: GoogleFonts.archivo(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.subText),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ArticleCard(picture: "picture", keywords: "keywords", title: "title", description: "description",isArticle: true),
                          ArticleCard(picture: "picture", keywords: "keywords", title: "title", description: "description",isArticle: true),
                          ArticleCard(picture: "picture", keywords: "keywords", title: "title", description: "description",isArticle: true),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),

                  ],
                ) ,

              )

            )

          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
