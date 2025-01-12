part of 'widgets.dart';

class descriptionCard extends StatelessWidget {
  final String food;
  final String amount;
  final String calorie;

  const descriptionCard({
    super.key,
    required this.food,
    required this.amount,
    required this.calorie
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$food  $amount",
              style: GoogleFonts.archivo(
                fontSize: 12,
                color: AppColors.subText,
              ),
            ),
            Text(
              calorie,
              style: GoogleFonts.archivo(
                fontSize: 12,
                color: AppColors.subText,
              ),
            ),

          ],
        ),
        SizedBox(height: 14),
      ],
    );
  }
}
