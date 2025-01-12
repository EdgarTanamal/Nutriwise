part of 'widgets.dart';

class dailyMealsCard extends StatelessWidget {
  final String isSelected;
  final double calorieConsumed;
  final double calorieGoal;


  const dailyMealsCard({
    super.key,
    required this.calorieConsumed,
    required this.calorieGoal,
    required this.isSelected,

  });

  @override
  Widget build(BuildContext context) {
    Color cardColor;
    List<Map<String, String>> descriptionCards;

    switch (isSelected) {
      case "Breakfast":
        cardColor =AppColors.green;
        descriptionCards = [
          {"food": "Coffee with milk", "amount": "100g", "calorie": "56 Kcal"},
          {"food": "Sandwich", "amount": "100g", "calorie": "250 Kcal"},
          {"food": "Omelette", "amount": "100g", "calorie": "100 Kcal"},
        ];
        break;
      case "Lunch":
        cardColor = AppColors.red; // Warna merah
        descriptionCards = [
          {"food": "Grilled Chicken", "amount": "200g", "calorie": "300 Kcal"},
          {"food": "Rice", "amount": "150g", "calorie": "200 Kcal"},
          {"food": "Salad", "amount": "100g", "calorie": "50 Kcal"},
        ];
        break;
      case "Dinner":
        cardColor = AppColors.blue; // Warna biru
        descriptionCards = [
          {"food": "Soup", "amount": "150g", "calorie": "100 Kcal"},
          {"food": "Steak", "amount": "200g", "calorie": "400 Kcal"},
          {"food": "Veggies", "amount": "100g", "calorie": "70 Kcal"},
        ];
        break;
      case "Snack":
        cardColor = AppColors.purple; // Warna ungu
        descriptionCards = [
          {"food": "Chips", "amount": "50g", "calorie": "150 Kcal"},
          {"food": "Cookies", "amount": "100g", "calorie": "250 Kcal"},
          {"food": "Juice", "amount": "200ml", "calorie": "100 Kcal"},
        ];
        break;
      default:
        cardColor = AppColors.backgroundCard; // Default warna kartu
        descriptionCards = [];
    }

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
                  color: cardColor,
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
                                        "$isSelected ",
                                      style: GoogleFonts.archivo(
                                        fontSize: 18,
                                        color: cardColor,
                                      ),
                                    ),
                                    Text(
                                        "$calorieConsumed Kcal",
                                      style: GoogleFonts.archivo(
                                        fontSize: 18,
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                    "Recommended ${calorieGoal-calorieConsumed} Kcal",
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
                        descriptionCards.isEmpty
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
                                children: descriptionCards.map((desc) {
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
                                fontSize: 10,
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

