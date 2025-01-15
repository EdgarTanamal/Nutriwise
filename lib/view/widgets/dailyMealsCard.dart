part of 'widgets.dart';

class dailyMealsCard extends StatelessWidget {


  const dailyMealsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Makes children stretch to the same height
            children: [
              Container(
                width: 10,
                decoration: BoxDecoration(
                  color: homeViewModel.cardColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(5),
                      topLeft:Radius.circular(5)
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.backgroundCard,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        "${homeViewModel.selectedMeal} ",
                                      style: GoogleFonts.archivo(
                                        fontSize: 18,
                                        color: homeViewModel.cardColor,
                                      ),
                                    ),
                                    Text(
                                        "${homeViewModel.calorieConsumed} Kcal",
                                      style: GoogleFonts.archivo(
                                        fontSize: 18,
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                    "Recommended ${homeViewModel.calorieGoal} Kcal",
                                  style: GoogleFonts.archivo(
                                    fontSize: 10,
                                    color: AppColors.subText
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.button,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    AppPicture.plusPicture,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
          
                          ],
                        ),
                        SizedBox(height: 20),
                        homeViewModel.descriptionCards.isEmpty
                            ?Container(
                                height: 70,
                                child: Center(
                                  child: Text(
                                    "There is no history yet",
                                    style: GoogleFonts.archivo(
                                      fontSize: 14,
                                      color: AppColors.subText,
                                    ),
                                  ),
                                ),
                              )
                            :Column(
                                children: homeViewModel.descriptionCards.map((desc) {
                                  return descriptionCard(
                                    food: desc["food"] ?? "",
                                    amount: desc["amount"] ?? "",
                                    calorie: desc["calorie"] ?? "",
                                  );
                                }).toList(),
                              ),
                        SizedBox(height: 19),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "See Details...",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.archivo(
                                fontSize: 14,
                                color: AppColors.textColor
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

