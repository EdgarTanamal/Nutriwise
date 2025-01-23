part of 'pages.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel homeViewModel;
  @override
  void initState() {
    super.initState();
    homeViewModel = HomeViewModel();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await homeViewModel.fetchSurveyDetails(); // Tunggu sampai selesai
      print("Total Calorie Goal: ${homeViewModel.totalCalorieGoal}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: homeViewModel,
        child: FutureBuilder(
          future: homeViewModel.fetchSurveyDetails(),
          builder: (context, snapshot) {
            if (homeViewModel.isLoading) {
              return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()));
            }
            return Consumer<HomeViewModel>(
              builder: (context, homeViewModel, _) {
                return WillPopScope(
                  onWillPop: () async {
                    return await homeViewModel.onBackPressed(context);
                  },
                  child: Scaffold(
                    appBar: const Header(),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.6,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: CalorieProgressIndicator(
                                      gradient: AppGradients.greenGradient,
                                      calorieConsumed:
                                          homeViewModel.totalCalorieConsumed,
                                      calorieGoal:
                                          homeViewModel.totalCalorieGoal,
                                      name: "Kcal available",
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              AppPicture.consumePicture,
                                              width:
                                                  30, // Increased size for better visibility
                                              height: 30,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                    "${homeViewModel.totalCalorieConsumed}",
                                                    style: GoogleFonts.archivo(
                                                        fontSize: 24,
                                                        color:
                                                            AppColors.textColor,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text("eaten",
                                                    style: GoogleFonts.archivo(
                                                        fontSize: 10,
                                                        color:
                                                            AppColors.subText)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              AppPicture.caloriePicture,
                                              width:
                                                  40, // Increased size for better visibility
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(width: 2),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                    "${homeViewModel.totalCalorieGoal}",
                                                    style: GoogleFonts.archivo(
                                                        fontSize: 24,
                                                        color:
                                                            AppColors.textColor,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text("Kcal Goal",
                                                    style: GoogleFonts.archivo(
                                                        fontSize: 10,
                                                        color:
                                                            AppColors.subText)),
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
                                color: AppColors.button,
                                borderRadius: BorderRadius.circular(
                                    15), // Set your border radius here
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
                                    Text(
                                      "Scan Your Food Here!",
                                      style: GoogleFonts.archivo(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 32),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Daily Meals",
                                          style: GoogleFonts.archivo(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textColor),
                                        ),
                                        Text(
                                          "see all",
                                          style: GoogleFonts.archivo(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.subText),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 32),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              homeViewModel.updateSelectedMeal(
                                                  "Breakfast");
                                            },
                                            child: CalorieProgressIndicator(
                                              gradient:
                                                  AppGradients.greenGradient,
                                              calorieConsumed: homeViewModel
                                                  .breakfastCalorie,
                                              calorieGoal:
                                                  homeViewModel.breakfastGoal,
                                              name: "Kcal",
                                              totalCalorie: false,
                                              isSelected:
                                                  homeViewModel.selectedMeal ==
                                                      "Breakfast",
                                              picture:
                                                  AppPicture.sunrisePicture,
                                              color: AppColors.breakfastBG,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              homeViewModel
                                                  .updateSelectedMeal("Lunch");
                                            },
                                            child: CalorieProgressIndicator(
                                              gradient:
                                                  AppGradients.redGradient,
                                              calorieConsumed:
                                                  homeViewModel.lunchCalorie,
                                              calorieGoal:
                                                  homeViewModel.lunchGoal,
                                              name: "Kcal",
                                              picture:
                                                  AppPicture.afternoonPicture,
                                              totalCalorie: false,
                                              color: AppColors.lunchBG,
                                              isSelected:
                                                  homeViewModel.selectedMeal ==
                                                      "Lunch",
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              homeViewModel
                                                  .updateSelectedMeal("Dinner");
                                            },
                                            child: CalorieProgressIndicator(
                                              totalCalorie: false,
                                              gradient:
                                                  AppGradients.blueGradient,
                                              calorieConsumed:
                                                  homeViewModel.dinnerCalorie,
                                              calorieGoal:
                                                  homeViewModel.dinnerGoal,
                                              name: "Kcal",
                                              picture: AppPicture.moonPicture,
                                              color: AppColors.dinnerBG,
                                              isSelected:
                                                  homeViewModel.selectedMeal ==
                                                      "Dinner",
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              homeViewModel
                                                  .updateSelectedMeal("Snack");
                                            },
                                            child: CalorieProgressIndicator(
                                              gradient:
                                                  AppGradients.purpleGradient,
                                              calorieConsumed:
                                                  homeViewModel.snackCalorie,
                                              calorieGoal:
                                                  homeViewModel.snackGoal,
                                              name: "Kcal",
                                              picture: AppPicture.snackPicture,
                                              totalCalorie: false,
                                              color: AppColors.snackBG,
                                              isSelected:
                                                  homeViewModel.selectedMeal ==
                                                      "Snack",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 32),
                                    dailyMealsCard(),
                                    SizedBox(height: 32),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Recommended Meals",
                                          style: GoogleFonts.archivo(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textColor),
                                        ),
                                        Text(
                                          "see all",
                                          style: GoogleFonts.archivo(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.subText),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ArticleCard(
                                            picture: "picture",
                                            isArticle: false,
                                            food: "FOOD",
                                            calorie: 300,
                                          ),
                                          ArticleCard(
                                            picture: "picture",
                                            isArticle: false,
                                            food: "FOOD",
                                            calorie: 300,
                                          ),
                                          ArticleCard(
                                            picture: "picture",
                                            isArticle: false,
                                            food: "FOOD",
                                            calorie: 300,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 32),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Newest Article",
                                          style: GoogleFonts.archivo(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textColor),
                                        ),
                                        Text(
                                          "see all",
                                          style: GoogleFonts.archivo(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.subText),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ArticleCard(
                                              picture: "picture",
                                              keywords: "keywords",
                                              title: "title",
                                              description: "description",
                                              isArticle: true),
                                          ArticleCard(
                                              picture: "picture",
                                              keywords: "keywords",
                                              title: "title",
                                              description: "description",
                                              isArticle: true),
                                          ArticleCard(
                                              picture: "picture",
                                              keywords: "keywords",
                                              title: "title",
                                              description: "description",
                                              isArticle: true),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 32),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    bottomNavigationBar: Navbar(),
                  ),
                );
              },
            );
          },
        ));
  }
}
