part of 'pages.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double calorieConsumed = 2400;
    double calorieGoal=2000;
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
                        calorieConsumed: calorieConsumed,
                        calorieGoal: calorieGoal,
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
                            "assets/images/restaurant.png",
                            width: 30,  // Increased size for better visibility
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          Column(
                            children: [
                              Text(
                                  "$calorieConsumed",
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
                            "assets/images/fire.png",
                            width: 40,  // Increased size for better visibility
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                          Column(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                        "assets/images/meal.png",
                      height: 36,
                      width: 36,
                    ),
                    Text("Scan Your Food Here!", style: GoogleFonts.archivo(fontSize: 15, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
